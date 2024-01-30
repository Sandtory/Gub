extends CharacterBody2D

enum COW_STATE {IDLE, WALK}

@export var move_speed : float= 50
@export var idle_time : float = 5
@export var walk_time : float = 2

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var sprite = $Sprite2D
@onready var timer = $Timer
@onready var hitbox = $CollisionShape2D

var is_being_dragged = false
var drag_target_position = Vector2.ZERO


var move_direction : Vector2 = Vector2.ZERO
var current_state : COW_STATE = COW_STATE.IDLE

func _ready():
	select_new_direction()
	pick_new_state()
	
func process(delta):
	if not is_being_dragged:
		select_new_direction()
		pick_new_state()
	
func _physics_process(_delta):
	if not is_being_dragged:
		if (current_state == COW_STATE.WALK):
			velocity = move_direction * move_speed
			
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
	
func select_new_direction():
	move_direction = Vector2(
		randi_range(-1,1),
		randi_range(-1,1)
	)
	
	if(move_direction.x < 0):
		sprite.flip_h = true
	elif (move_direction.x > 0):
		sprite.flip_h = false
	
func pick_new_state():
	if(current_state == COW_STATE.IDLE):
		state_machine.travel("walk")
		current_state = COW_STATE.WALK
		select_new_direction()
		timer.start(walk_time)
	elif(current_state == COW_STATE.WALK):
		state_machine.travel("idle")
		current_state = COW_STATE.IDLE
		timer.start(idle_time)


func _on_timer_timeout():
	pick_new_state()
