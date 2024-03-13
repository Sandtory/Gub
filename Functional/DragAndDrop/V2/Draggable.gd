extends Node2D

@export var stats : CharacterStats
@onready var timer = $Timer

signal mouse_released

var highlighted = false
var is_dragging = false
var selected = false
var rest_point
var rest_nodes = []

func _ready():
	_get_character_stats()
	rest_nodes = get_tree().get_nodes_in_group("zone")
	var found_free_zone = false
	for dropZone in rest_nodes:
		if not dropZone.is_occupied:
			rest_point = dropZone.global_position
			dropZone.occupy()
			dropZone.select()
			found_free_zone = true
			break
	if not found_free_zone:
		print("No free DropZones available!")
	

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		for child in rest_nodes:
			if child.global_position == rest_point:
				child.set_available()
		
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Click detected outside the character, set highlighted to false
			highlighted = false
			get_node("Pointer").hide()
			get_node("InputRegister").show()
			get_node("Name").hide()
			get_node("StatsPanel").hide()
			
			

func _get_character_stats():
	get_node("Animation").play(stats.characterColor)
	get_node("Name").text = stats.name
	get_node("StatsPanel/Health").text = "Health: " + str(stats.health)
	get_node("StatsPanel/Level").text = "Level: " + str(stats.level)
	get_node("StatsPanel/XP").text = "XP: " + str(stats.experience)

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)
"""
func _input(event):
	rest_nodes = get_tree().get_nodes_in_group("zone")
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			Draggable.is_dragging = false
			var shortest_dist = 88
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
					
"""
func _input(event):
	if event is InputEventMouseButton and not event.pressed:
		selected = false
		var shortest_dist = 88
		var closest_free_zone = null
		for child in rest_nodes:
			var distance = global_position.distance_to(child.global_position)
			if distance < shortest_dist and not child.is_occupied:
				closest_free_zone = child
				shortest_dist = distance
		if closest_free_zone:
			closest_free_zone.select()
			rest_point = closest_free_zone.global_position
			# Mark the chosen DropZone as occupied
			closest_free_zone.occupy()
			# Optionally, free the previous DropZone if moving from another

func _on_button_pressed():
	highlighted = true
	get_node("Pointer").show()
	get_node("InputRegister").hide()
	get_node("Name").show()
	get_node("StatsPanel").show()
	



func _on_timer_timeout():
	if not is_dragging:
		selected = true
		await mouse_released
		selected = false


func _on_input_register_button_up():
	if not timer.is_stopped():
		timer.stop()
		await mouse_released
		selected = false
