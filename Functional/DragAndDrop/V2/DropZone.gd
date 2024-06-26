extends Marker2D

@export var droppable_resource: Droppable

var is_occupied = false
var current_occupants = 0


func _draw():
	# draw_circle(Vector2.ZERO, 75, Color.ALICE_BLUE)
	# draw_texture_rect(texture, Rect2(-48,-48,96,96),false,  Color.BLANCHED_ALMOND)
	draw_rect(Rect2(droppable_resource.size), Color.AQUA, false)
	
func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	
func deselect():
	pass

func occupy():
	is_occupied = true
	update_visuals_for_occupancy()
	print(name + " occupied.")
	
func set_available():
	is_occupied = false
	update_visuals_for_occupancy()
	print(name + " available.")
	
func update_visuals_for_occupancy():
	modulate = Color.WHITE if is_occupied == false else Color.GRAY
