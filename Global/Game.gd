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


#GameManager

# GameManager.gd

func can_buy(item_cost : int) -> bool:
    return GubBucks >= item_cost

func spend_resources(cost : int):
    GubBucks -= cost

# Shop dictionary
var character_shop = {
    0: {
        "name": "Fly",
        "cost": 10,
        "description": "A fly can be used to scout on missions.",
        "icon": preload("res://icon.png")
        
    },
    1: {
        "name": "Locust",
        "cost": 50,
        "description": "A locust can be used to gather resources.",
        "icon": preload("res://icon.png")
    },
    2: {
        "name": "Beetle",
        "cost": 130,
        "description": "A beetle can be used to protect your base.",
        "icon": preload("res://icon.png")
    },
    3: {
        "name": "Wasp",
        "cost": 280,
        "description": "A wasp can be used to steal resources from other bases.",
        "icon": preload("res://icon.png")
    }
}

var building_shop = {
    0: {
        "name": "Living Quarters",
        "cost": 50,
        "description": "A place for your bugs to live.",
        "icon": preload("res://icon.png")
    },
}

var inventory = {
    0: {
        "name": "Locust",
        "cost": 10,
        "description": "A locust that can be used to gather resources.",
        "amount": 1,
    },
}