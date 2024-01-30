class_name ZoomCamera
extends Camera2D

var last_drag_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event.is_action_pressed("up"):
		zoom_on_cursor(0.9) # Zoom in
	elif event.is_action_pressed("down"):
		zoom_on_cursor(1.1) # Zoom out
		
	if Draggable.is_dragging == false:
		if event is InputEventScreenDrag:
			_handle_screen_drag(event)

func zoom_on_cursor(zoom_factor: float):
	var old_zoom := zoom
	zoom *= zoom_factor

	# Calculate the new position based on the mouse position
	var local_mouse_position := get_local_mouse_position()
	var viewport_size := get_viewport_rect().size
	var offset_change := local_mouse_position * (zoom - old_zoom) / old_zoom
	global_position += offset_change

	# Optionally, you can clamp the camera position here
	# to prevent it from going out of certain bounds.
	
func _handle_screen_drag(event: InputEventScreenDrag):
	var drag_delta = event.relative
	position -= drag_delta  # Move the camera opposite to drag direction
	last_drag_position = event.position
