extends Node2D

var locustCharacter = preload("res://UI/DragAndDrop/draggable_object.tscn")
var locustInstance = null
var locustAdded = false
var building = preload("res://UI/DragAndDrop/droppable_area.tscn")
var buildingInstance = null
var buildingAdded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#Utils.save_game()
	Utils.load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Game.locust_owned == true and not locustAdded:
		locustInstance = locustCharacter.instantiate()
		self.add_child(locustInstance)
		locustAdded = true
	if Game.building1_owned == true and not buildingAdded:
		buildingInstance = building.instantiate()
		self.add_child(buildingInstance)
		buildingAdded = true
		
		
