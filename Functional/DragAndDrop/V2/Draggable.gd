extends Node2D

var draggable = false
var selected = false
var rest_point
var rest_nodes = []


func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		Draggable.is_dragging = true

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)

func _input(event):
	rest_nodes = get_tree().get_nodes_in_group("zone")
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			Draggable.is_dragging = false
			var shortest_dist = 64
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance

func _on_area_2d_body_entered(body:Node2D):
	if body.is_in_group("zone"):
		body.modulate = Color(Color.AZURE, 0.3)


func _on_area_2d_body_exited(body:Node2D):
	if body.is_in_group("zone"):
		body.modulate = Color(Color.AZURE, 0.5)
	
func _on_area_2d_mouse_entered():
	if not Draggable.is_dragging:
		draggable = true
		scale = Vector2(1.2, 1.2)

func _on_area_2d_mouse_exited():
	if not Draggable.is_dragging:
		draggable = false
		scale = Vector2(1, 1)


