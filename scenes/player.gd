extends CharacterBody2D

@export var speed: float = 300.0
@export var gravity_strength: float = 1200.0

@export var min_jump_strength: float = 500.0
@export var max_jump_strength: float = 1000.0
@export var max_charge_time: float = 1.0

var is_charging = false
var charge_time = 0.0

func _physics_process(delta: float) -> void:
	get_input(delta)
	gravity(delta)
	move_and_slide()

func get_input(delta: float) -> void:
	var direction_x: float= Input.get_axis("left", "right")
	velocity.x = direction_x * speed
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		is_charging = true
		charge_time = 0.0
	
	if is_charging:
		charge_time = min(charge_time + delta, max_charge_time)
	
	if Input.is_action_just_released("jump") and is_charging:
		var t: float = charge_time / max_charge_time
		var force: float = lerp(min_jump_strength, max_jump_strength, t)
		velocity.y = -force
		is_charging = false
		charge_time = 0.0

func gravity(delta: float) -> void:
	if not is_on_floor() :
		velocity.y += gravity_strength * delta
