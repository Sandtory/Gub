extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CloseButton").hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shop_button_pressed():
	get_node("Resources").hide()
	get_node("Shop").show()
	get_node("ShopButton").hide()
	get_node("CloseButton").show()


func _on_close_button_pressed():
	get_node("Shop").hide()
	get_node("Resources").show()
	get_node("ShopButton").show()
	get_node("CloseButton").hide()
