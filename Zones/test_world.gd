extends Node2D

var beetle = preload("res://Characters/Beetle/BeetleCharacter.tscn")
var beetle_stats = preload("res://Characters/Beetle/beetle_stats.tres")

var possible_colors = ["Red", "Green", "Blue", "Yellow", "Pink", "White"]
var possible_names = ["Bum", "Jit", "Scur", "Twis", "Grub", "Mud", "Dun", "Glim", "Spar", "Chit", "Hak", "Jon"]

	# Check occupancy count


func _ready():
	#get_node("Panel/Label").text = str(occupied_count) + "/" + str(dropzones.size())
	pass
	
func _on_buy_button_pressed():
	var beetle_instance = beetle.instantiate()
	var random_stats = beetle_stats.duplicate()
	
	var dropzones = get_tree().get_nodes_in_group("zone")
	var occupied_count = 0
	
	for dropzone in dropzones:
		if dropzone.is_occupied:
			occupied_count += 1
			
	# Conditionally exit function so that you can not have more draggables than dropzones
	if occupied_count >= dropzones.size():
		print("All DropZones are occupied. Cannot add more Draggables.")
		return 
	
	random_stats.characterColor = possible_colors[randi() % possible_colors.size()]
	random_stats.name = possible_names[randi() % possible_names.size()] + "tle"
	
	var character_object = beetle_instance.get_node("Object")
	if character_object:
		character_object.stats = random_stats
	
	add_child(beetle_instance)
