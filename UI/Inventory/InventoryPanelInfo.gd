extends CanvasLayer

var draggable_character = preload("res://Functional/DragAndDrop/V2/Draggable.tscn")

@onready var game_world = get_node("../../../World/GameWorld")

var itemName = ""
var itemDes = ""
var itemCost = 0
var itemCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func updateInfo():
	get_node("Name").text = itemName
	get_node("Description").text = itemDes

func _on_exit_pressed():
	get_node("AnimationPlayer").play("TransitionOut")
	get_node("../../").process_mode = Node.PROCESS_MODE_ALWAYS

func _on_summon_pressed():
	for i in Game.inventory:
		if Game.inventory[i]["name"] == itemName:
			itemCount -= 1
			if itemCount == 0:
				# Remove item from inventory then update the inventory
				var tempDic = {}
				for x in Game.inventory:
					if x > i:
						tempDic[x-1] = Game.inventory[x]
					elif x < i: 
						tempDic[x] = Game.inventory[x]
				Game.inventory.clear()
				Game.inventory = tempDic
				_on_exit_pressed()

			else:
				Game.inventory[i]["count"] -= 1
			get_node("../InventoryContainer").fillInventorySlots()

			#Instantiate the NPC
			var character_scene = draggable_character.instantiate()
			game_world.add_child(character_scene)
			


