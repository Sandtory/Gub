extends GridContainer

@onready var item = preload("InventoryPanel.tscn")

var invSize = 9

func _ready():
	# load slots in
	for i in invSize:
		var itemTemp = item.instantiate()
		add_child(itemTemp)
	
	# fill slots with items
	fillInventorySlots()

func fillInventorySlots():
	# Empty all slots
	for i in invSize:
		get_child(i).itemName = ""
		get_child(i).itemDes = ""
		get_child(i).itemCost = 0
		get_child(i).itemCount = 0
		get_child(i).hasItem = false
	# Fills in inv => slots
	for i in Game.inventory:
		get_child(i).itemName = Game.inventory[i]["name"]
		get_child(i).itemCost = Game.inventory[i]["cost"]
		get_child(i).itemDes = Game.inventory[i]["description"]
		get_child(i).itemCount = Game.inventory[i]["count"]
		get_child(i).get_node("InventoryItem").texture = Game.inventory[i]["icon"]
		get_child(i).hasItem = true
