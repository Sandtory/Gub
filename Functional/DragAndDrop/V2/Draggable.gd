extends Node2D

@export var stats : CharacterStats

var highlighted = false
var selected = false
var is_dragging = false
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
		print("area 2d click")
		update_character_stats()
		if highlighted:
			selected = true
			for child in rest_nodes:
				if child.global_position == rest_point:
					child.set_available()
		elif not highlighted:
			highlighted = true
			_show_details()

# Function for handling events that are not on the area 2D, copies of same area 2D's does not count as unhandled input
func _unhandled_input(event):
	if Input.is_action_just_pressed("click"):
		print("Unhandled click")
		# Click detected outside the character, set highlighted to false
		highlighted = false
		_hide_details()
			
			

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)

func _input(event):
	if event is InputEventMouseButton:
		print("input event")
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
			
			
func _get_character_stats():
	get_node("Animation").play(stats.characterColor)
	get_node("Name").text = stats.name
	get_node("StatsPanel/Health").text = "Health: " + str(stats.health)
	get_node("StatsPanel/Level").text = "Level: " + str(stats.level)
	get_node("StatsPanel/XP").text = "XP: " + str(stats.experience)

func _show_details():
	get_node("Pointer").show()
	get_node("Name").show()
	get_node("StatsPanel").show()

func _hide_details():
	get_node("Pointer").hide()
	get_node("Name").hide()
	get_node("StatsPanel").hide()

func update_character_stats():
	stats.gainxp(10)
	_get_character_stats()
