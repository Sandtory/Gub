extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_build_toggle_pressed():
	var selection_ui = get_node("GameUI/PlaceableSelectionUI")
	selection_ui.show()