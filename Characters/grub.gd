extends CharacterBody2D

@export var move_speed : float = 100
@export var jump_force : float = 500
@export var gravity : float = 1200

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var hitbox = $CollisionShape2D

var input_direction : Vector2 = Vector2.ZERO

var is_being_dragged = false
var drag_target_position = Vector2.ZERO

func _ready():
	animation_tree.active = true
	set_process_input(true) 

func _process(delta):
	if not is_being_dragged:
		update_animation_parameters()

func _physics_process(delta):
	if not is_being_dragged:
		input_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")

		if is_on_floor() and Input.is_action_just_pressed("jump"):
			velocity.y = -jump_force

		velocity.y += gravity * delta

		if input_direction.x != 0:
			sprite.flip_h = input_direction.x < 0
			velocity.x = input_direction.x * move_speed
		else:
			velocity.x = 0

		move_and_slide()
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if is_mouse_in_hitbox(event.position):
					is_being_dragged = true
					position = get_global_mouse_position()
			else:
				is_being_dragged = false
				
	if event is InputEventMouseMotion and is_being_dragged:
		position = get_global_mouse_position()
		
func is_mouse_in_hitbox(global_point):
	var space_state = get_world_2d().direct_space_state
	var collision_query_parameters = PhysicsShapeQueryParameters2D.new()
	collision_query_parameters.set_shape(hitbox.shape)
	collision_query_parameters.transform = Transform2D(0, global_point)
	var result = space_state.intersect_shape(collision_query_parameters, 1)
	return result.size() > 0

func update_animation_parameters():
	if is_on_floor():
		if velocity.x == 0:
			animation_tree["parameters/conditions/idle"] = true
			animation_tree["parameters/conditions/is_moving"] = false
		else:
			animation_tree["parameters/conditions/idle"] = false
			animation_tree["parameters/conditions/is_moving"] = true
			animation_tree["parameters/walk/blend_position"] = input_direction
	else:
		if velocity.y < 0:
			# Play walking upwards animation
			animation_tree["parameters/conditions/idle"] = false
			animation_tree["parameters/conditions/is_moving"] = true
			animation_tree["parameters/walk/blend_position"] = Vector2(0, -1)
		# You can add additional conditions here for falling or other aerial states

	# Update idle animation blend position even when in air, in case you have directional idle animations
	if input_direction.x != 0:
		animation_tree["parameters/idle/blend_position"] = input_direction
