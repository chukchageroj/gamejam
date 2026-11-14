extends CharacterBody2D

var direction_x: float
@export var speed = 300
@export var jump_strength = 500
@export var gravity_strength = 10


func _physics_process(delta: float) -> void:
	get_input()
	gravity()
	move_and_slide()

func get_input():
	direction_x = Input.get_axis("left", "right")
	velocity.x = direction_x * speed
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_strength

func gravity():
	if not is_on_floor() :
		velocity.y += gravity_strength
