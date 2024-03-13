extends CanvasLayer

@onready var animation_player = get_node("Shop/AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CloseButton").hide()
	get_node("ExitInventory").hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shop_button_pressed():
	get_node("Shop/AnimationPlayer").play("TransitionIn")
	get_node("Shop").show()
	get_node("Resources").hide()
	get_node("ShopButton").hide()
	get_node("CloseButton").show()
	get_node("OpenInventory").hide()
	get_node("InventoryUi").hide()
	get_node("ExitInventory").hide()
	get_node("BuildToggle").hide()


func _on_close_button_pressed():
	get_node("Shop/AnimationPlayer").play("TransitionOut")
	get_node("Resources").show()
	get_node("ShopButton").show()
	get_node("CloseButton").hide()
	get_node("OpenInventory").show()
	get_node("BuildToggle").show()


func _on_open_inventory_pressed():
	get_node("InventoryUi").show()
	get_node("ExitInventory").show()
	get_node("InventoryUi/AnimationPlayer").play("InventoryOpen")
	get_node("OpenInventory").hide()
	get_node("InventoryUi/InventoryContainer").fillInventorySlots()


func _on_exit_inventory_pressed():
	get_node("InventoryUi/AnimationPlayer").play("InventoryClose")	
	get_node("OpenInventory").show()
	get_node("ExitInventory").hide()
		
