require "Items/SuburbsDistributions"

local gameNightDistro = require "gameNight - Distributions"

gameNightDistro.proceduralDistGameNight.itemsToAdd["BattleShip_GameStand_Open"] = {}

gameNightDistro.gameNightBoxes["BattleShip_GameStand_Open"] = {
    rolls = 1,
    items = {
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
        "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999, "BattleShip_Peg_White", 9999,
		
        "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999,
        "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999,
        "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999,
        "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999,
        "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999,
        "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999,	
		"BattleShip_Peg_Red", 9999, "BattleShip_Peg_Red", 9999,			
		
        "BattleShip_Ship_Battleship", 9999,
        "BattleShip_Ship_Carrier", 9999,
        "BattleShip_Ship_Destroyer", 9999,
        "BattleShip_Ship_Submarine", 9999,
        "BattleShip_Ship_PatrolBoat", 9999,
    },
    junk = { rolls = 1, items = {} }, fillRand = 0,
}