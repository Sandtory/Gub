extends Node

var button_toggle = true
@onready var tab_container = get_node("GameUI/PlaceableSelectionUI/TabContainer")
@onready var exit_build = InputEventAction.new()
@onready var open_build = InputEventAction.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_build_toggle_pressed():
	if button_toggle:
		open_build.action = "open_build"
		open_build.pressed = true
		Input.parse_input_event(open_build)
		button_toggle = false
		return
	if not button_toggle:
		tab_container.hide()
		exit_build.action = "exit_build"
		exit_build.pressed = true
		Input.parse_input_event(exit_build)
		button_toggle = true
		return
