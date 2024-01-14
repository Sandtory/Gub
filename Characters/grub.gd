extends CharacterBody2D

@export var move_speed : float = 300
@export var jump_force : float = 500
@export var gravity : float = 1200

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite = $Sprite2D

var input_direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true

func _process(delta):
	update_animation_parameters()

func _physics_process(delta):
	input_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force

	velocity.y += gravity * delta

	if input_direction.x != 0:
		sprite.flip_h = input_direction.x < 0

	velocity.x = input_direction.x * move_speed

	move_and_slide()

	update_animation_parameters()

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
