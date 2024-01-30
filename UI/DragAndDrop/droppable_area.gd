extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.AZURE, 0.3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Draggable.is_dragging:
		visible =true
	else:
		visible = false
