extends Node2D

var locustCharacter: PackedScene = preload("res://UI/DragAndDrop/draggable_object.tscn")
var locustInstance: Node2D = null
var locustAdded: bool = false

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
		
		
