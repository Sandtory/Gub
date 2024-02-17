extends CanvasLayer

@onready var shop = get_tree().get_root().get_node("UI/Shop/Shop.gd/Character/PurchaseLocustButton")
@onready var inventory = get_tree().get_root().get_node("UI/Inventory/Inventory.gd")



# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	# shop.connect("item_bought", inventory, "_on_item_bought")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_item_bought(item_name: String, item_cost: int):
	print("Bought item: " + item_name)
	
