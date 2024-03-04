extends Node

var button_toggle = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_build_toggle_pressed():
	var building_system = get_node("Systems/BuildingSystem")
	if button_toggle:
		get_node("GameUI/PlaceableSelectionUI/TabContainer").show()
		button_toggle = false
		return
	if not button_toggle:
		get_node("GameUI/PlaceableSelectionUI/TabContainer").hide()
		button_toggle = true
		return
