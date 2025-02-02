require "Items/SuburbsDistributions"

local gameNightDistro = require "gameNight - Distributions"

gameNightDistro.proceduralDistGameNight.itemsToAdd["BattleShip_Box"] = {}
gameNightDistro.gameNightBoxes["BattleShip_Box"] = { BattleShip_GameStand = 2, }


gameNightDistro.proceduralDistGameNight.itemsToAdd["BattleShip_GameStand"] = { chanceFactor = 0.0001,}
gameNightDistro.gameNightBoxes["BattleShip_GameStand"] = {
    BattleShip_Ship_Battleship = 1, BattleShip_Ship_Carrier = 1, BattleShip_Ship_Destroyer = 1,
    BattleShip_Ship_Submarine = 1, BattleShip_Ship_PatrolBoat = 1,
    BattleShip_Peg_White = 84, BattleShip_Peg_Red = 42,
}