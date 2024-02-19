extends Node


var GubBucks = 0
var Gems = 0
var DewDrops = 0


# Character values

# Locust
var locust_owned = false
var locust_amount = []


# Fly
var fly_owned = false


# Beetle


# Building values

# Building one
var livingQuarters_owned = false


# Shop dictionary
var character_shop = {
	0: {
		"name": "Fly",
		"cost": 10,
		"description": "A fly can be used to scout on missions.",
		"icon": preload("res://art/PreloadCharacterIcons/GiantFly.png")
		
	},
	1: {
		"name": "Leafbug",
		"cost": 50,
		"description": "A leafbug can be used to gather resrouces and build",
		"icon": preload("res://art/PreloadCharacterIcons/LavaAnt.png") 
	},
	2: {
		"name": "Beetle",
		"cost": 130,
		"description": "A beetle can be used to protect your base.",
		"icon": preload("res://art/PreloadCharacterIcons/Clampbeetle.png")
	},
	3: {
		"name": "Locust",
		"cost": 280,
		"description": "A Locust can be used to steal resources from other bases.",
		"icon": preload("res://art/PreloadCharacterIcons/FlyingLocust.png")
	},
	4: {
		"name": "Snail",
		"cost": 320,
		"description": "A snail will boost the morale of other insects.",
		"icon": preload("res://art/PreloadCharacterIcons/GrizzledTreant.png")
	},
	5: {
		"name": "Magnus",
		"cost": 500,
		"description": "A Magnus Mosquito can be used to annoy the opponent.",
		"icon": preload("res://art/PreloadCharacterIcons/MagnusMosquito.png")
	},
	6: {
		"name": "Wasp",
		"cost": 600,
		"description": "A Wasp can be used to attack other bases.",
		"icon": preload("res://art/PreloadCharacterIcons/Firewasp.png")
	}
}

var building_shop = {
	0: {
		"name": "Living Quarters",
		"cost": 50,
		"description": "A place for your bugs to live.",
	},
}

var inventory = {
	0: {
		"name": "Fly",
		"cost": 10,
		"description": "A fly can be used to scout on missions.",
		"icon": preload("res://art/PreloadCharacterIcons/GiantFly.png"),
		"count": 1,
	},
}
