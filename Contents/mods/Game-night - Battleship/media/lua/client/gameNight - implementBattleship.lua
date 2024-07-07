local applyItemDetails = require "gameNight - applyItemDetails"
local deckActionHandler = applyItemDetails.deckActionHandler
local gamePieceAndBoardHandler = applyItemDetails.gamePieceAndBoardHandler

-- Define Battleship game items
local battleshipItems = {
    BattleShip_Box_Sealed = "Battleship Box (Sealed)",
    BattleShip_Box = "Battleship Box",
    BattleShip_GameStand_Closed = "Battleship Gamestand (Closed)",
    BattleShip_GameStand_Open = "Battleship Gamestand (Open)",
    BattleShip_Peg_Red = "Red Peg",
    BattleShip_Peg_White = "White Peg",
    BattleShip_Ship_Battleship = "Carrier",
    BattleShip_Ship_Carrier = "Battleship",
    BattleShip_Ship_Destroyer = "Destroyer",
    BattleShip_Ship_Submarine = "Submarine",
    BattleShip_Ship_PatrolBoat = "Patrol Boat"
}

-- Register game pieces
gamePieceAndBoardHandler.registerTypes({
	"GameNight_BattleShip.BattleShip_GameStand_Open",
    "GameNight_BattleShip.BattleShip_Peg_Red", "GameNight_BattleShip.BattleShip_Peg_White",
    "GameNight_BattleShip.BattleShip_Ship_Battleship", "GameNight_BattleShip.BattleShip_Ship_Carrier",
    "GameNight_BattleShip.BattleShip_Ship_Destroyer", "GameNight_BattleShip.BattleShip_Ship_Submarine",
    "GameNight_BattleShip.BattleShip_Ship_PatrolBoat"
})

-- Register special properties for each item using custom textures
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_GameStand_Open", { actions = { lock=true }, category = "GameBoard", textureSize = {720,965},})
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_Peg_Red", {
	actions = { lock=true }, 
    noRotate = true,
})
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_Peg_White", {
	shiftAction = "examine",
	actions = {lock=true, examine=true},

})
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_Ship_Battleship", {
	shiftAction = "examine", actions = {turnShip=true, lock=true, examine=true},

})
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_Ship_Carrier", {
    --altState="Domino_Flipped",
	shiftAction = "examine", actions = {turnShip=true, lock=true, examine=true},

})
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_Ship_Destroyer", {
	shiftAction = "examine", actions = {turnShip=true, lock=true, examine=true},

})
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_Ship_Submarine", {
	shiftAction = "examine", actions = {turnShip=true, lock=true, examine=true},

})
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShip_Ship_PatrolBoat", {
	shiftAction = "examine", actions = {turnShip=true, lock=true, examine=true},

})

---Define new function under `gamePieceAndBoardHandler`
function gamePieceAndBoardHandler.turnShip(gamePiece, player)
    local current = gamePiece:getModData()["gameNight_rotation"] or 0

    local states = {[0]=90,[90]=180,[180]=270,[270]=0}
    local state = states[current]

    if not state then
        local closest = false
        for id,angle in pairs(states) do
            if (not closest) or (closest and math.abs(angle-current) < states[closest]) then
                closest = id
            end
        end
        state = states[closest]
    end

    gamePieceAndBoardHandler.playSound(gamePiece, player)
    gamePieceAndBoardHandler.pickupAndPlaceGamePiece(player, gamePiece, {gamePieceAndBoardHandler.setModDataValue, gamePiece, "gameNight_rotation", state})
end


-- Battleship game logic
local battleshipGame = {}
battleshipGame.gridSize = 10
battleshipGame.ships = {
    {name = "Carrier", size = 1},
    {name = "Battleship", size = 1},
    {name = "Destroyer", size = 1},
    {name = "Submarine", size = 1},
    {name = "Patrol Boat", size = 1}
}

battleshipGame.playerBoards = {
    player1 = {grid = {}, ships = {}, locked = false},
    player2 = {grid = {}, ships = {}, locked = false}
}

-- Initialize empty grids for each player
for _, player in pairs(battleshipGame.playerBoards) do
    for i = 1, battleshipGame.gridSize do
        player.grid[i] = {}
        for j = 1, battleshipGame.gridSize do
            player.grid[i][j] = "empty"
        end
    end
end

-- Function to place ships on the board
function battleshipGame.placeShip(player, ship, startRow, startCol, isVertical)
    if player.locked then
        print("Cannot place ships, board is locked!")
        return
    end

    for i = 0, ship.size - 1 do
        if isVertical then
            player.grid[startRow + i][startCol] = ship.name
        else
            player.grid[startRow][startCol + i] = ship.name
        end
    end
    table.insert(player.ships, {name = ship.name, size = ship.size, hits = 0})
end

-- Function to start the game (lock ship positions)
function battleshipGame.startGame()
    battleshipGame.playerBoards.player1.locked = true
    battleshipGame.playerBoards.player2.locked = true
    print("Game started! Ship positions are locked.")
end

-- Function to handle a player's shot
function battleshipGame.shoot(player, opponentBoard, row, col)
    if not opponentBoard.locked then
        print("Opponent has not locked their board yet!")
        return
    end

    local tile = opponentBoard.grid[row][col]
    if tile == "empty" then
        print("Miss!")
        opponentBoard.grid[row][col] = "miss"
    else
        print("Hit!")
        opponentBoard.grid[row][col] = "hit"
        for _, ship in pairs(opponentBoard.ships) do
            if ship.name == tile then
                ship.hits = ship.hits + 1
                if ship.hits == ship.size then
                    print("You sunk a " .. ship.name .. "!")
                end
                break
            end
        end
    end
end

-- Function to end the game (clear the board)
function battleshipGame.endGame()
    for _, player in pairs(battleshipGame.playerBoards) do
        for i = 1, battleshipGame.gridSize do
            for j = 1, battleshipGame.gridSize do
                player.grid[i][j] = "empty"
            end
        end
        player.ships = {}
        player.locked = false
    end
    print("Game ended! Boards are cleared.")
end

-- Register the game board with the handlers
gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShipBoard", {
    category = "GameBoard",
    texture = "UI_Gameboard.png",
    textureSize = {500, 500},
    actions = { lock = true }
})

gamePieceAndBoardHandler.registerSpecial("GameNight_BattleShip.BattleShipPiece", {
    alternateStackRendering = { func = "DrawTextureCardFace", depth = 5 }
})

-- Example usage
-- Place ships (this would normally be done with user input)
battleshipGame.placeShip(battleshipGame.playerBoards.player1, battleshipGame.ships[1], 1, 1, true) -- Place Carrier vertically at A1
battleshipGame.placeShip(battleshipGame.playerBoards.player2, battleshipGame.ships[2], 3, 3, false) -- Place Battleship horizontally at C3

-- Start the game (lock ship positions)
battleshipGame.startGame()

-- Example shots
battleshipGame.shoot("player1", battleshipGame.playerBoards.player2, 3, 3) -- Player 1 shoots at C3

-- End the game (clear the board)
battleshipGame.endGame()
