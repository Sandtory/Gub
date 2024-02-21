extends Panel

@onready var building = preload("res://UI/DragAndDrop/droppable_area.tscn")
var currTile

var itemName = ""
var itemDes = ""
var itemCost = 0
var itemCount = 0
var hasItem = false
var mouseEntered = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	var text = get_node("Count")
	text.text = str(itemCount)
	if hasItem ==  true:
		get_node("InventoryItem").show()
		get_node("Count").show()
	else:
		get_node("InventoryItem").hide()
		get_node("Count").hide()

# Drag and drop logic to be continued
"""
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
"""

func _on_mouse_entered():
	if hasItem == true:
		mouseEntered = true

func _on_mouse_exited():
	mouseEntered = false

func _input(event):
	if event.is_action_pressed("click"):
		if mouseEntered:
			get_node("../../InventoryPanelInfo").show()
			get_node("../../InventoryPanelInfo/Icon").texture = get_node("InventoryItem").texture
			get_node("../../InventoryPanelInfo").itemName = itemName
			get_node("../../InventoryPanelInfo").itemDes = itemDes
			get_node("../../InventoryPanelInfo").itemCost = itemCost
			get_node("../../InventoryPanelInfo").itemCount = itemCount
			get_node("../../InventoryPanelInfo/AnimationPlayer").play("TransitionIn")
			get_node("../../InventoryPanelInfo").updateInfo()
