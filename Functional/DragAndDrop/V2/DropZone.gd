extends Marker2D

var texture = load("res://art/Buildings/LivingQuarters.png")


func _draw():
	#draw_circle(Vector2.ZERO, 75, Color.ALICE_BLUE)
	draw_texture_rect(texture, Rect2(-48,-48,96,96),false,  Color.BLANCHED_ALMOND)
	
func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	
	modulate = Color.SEA_GREEN
	
func deselect():
	modulate = Color.WHITE
	
