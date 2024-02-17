extends Panel

@onready var building = preload("res://UI/DragAndDrop/droppable_area.tscn")
var currTile

func _ready():
	pass # Replace with function body.


func _on_gui_input(event):
	var tempBuilding = building.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		# Left click down
		add_child(tempBuilding)
		tempBuilding.process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask == 1:
		# Left click down drag
		get_child(1).global_position = event.global_position
	elif event is InputEventMouseButton and event.button_mask == 0:
		# Left click up
		if get_child_count() > 1:
			get_child(1).queue_free() 
			var path = get_tree().get_root().get_node("Main/Buildings")
			path.add_child(tempBuilding)
			tempBuilding.global_position = event.global_position
			tempBuilding.get_node("Area").hide()
