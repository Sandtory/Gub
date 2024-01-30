extends Node2D


var last_drag_position = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	# Enable to restart save file, call for load to load previous
	# Utils.save_game() 
	Utils.load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

