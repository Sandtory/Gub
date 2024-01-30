extends CharacterBody2D

enum NPC_STATE {IDLE, WALK}

@export var move_speed : float= 50
@export var idle_time : float = 5
@export var walk_time : float = 2
@export var gravity : float = 1200

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var sprite = $Sprite2D
@onready var timer = $Timer

var move_direction : Vector2 = Vector2.ZERO
var current_state : NPC_STATE = NPC_STATE.IDLE

func _ready():
	select_new_direction()
	pick_new_state()
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if (current_state == NPC_STATE.WALK and velocity.y == 0):
		velocity = move_direction * move_speed 
	move_and_slide()

	
	
	
	
func select_new_direction():
	move_direction = Vector2(
		randi_range(-1,1),
		0
	)
	
	if(move_direction.x < 0):
		sprite.flip_h = false
	elif (move_direction.x > 0):
		sprite.flip_h = true
	
func pick_new_state():
	if(current_state == NPC_STATE.IDLE):
		state_machine.travel("walk")
		current_state = NPC_STATE.WALK
		select_new_direction()
		timer.start(walk_time)
	elif(current_state == NPC_STATE.WALK):
		state_machine.travel("idle")
		current_state = NPC_STATE.IDLE
		timer.start(idle_time)


func _on_timer_timeout():
	pick_new_state()
