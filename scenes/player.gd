extends CharacterBody2D

@export var speed: float = 200.0
@export var gravity_strength: float = 1200.0

@export var min_jump_strength: float = 500.0
@export var max_jump_strength: float = 1000.0
@export var max_charge_time: float = 0.5

@export var landing_duration: float = 0.25

@export var wind_speed: float = -30.0

var is_charging: bool = false
var charge_time: float = 0.0
var direction_x: float = 0.0
var landing_timer: float = 0.0
var air_is_on: bool = false

func _physics_process(delta: float) -> void:
	get_input(delta)
	apply_gravity(delta)

	var was_on_floor := is_on_floor()
	move_and_slide()

	if not was_on_floor and is_on_floor():
		landing_timer = landing_duration
		$AnimatedSprite2D.play("landing")

	landing_timer = max(landing_timer - delta, 0.0)
	animation()

func get_input(delta: float) -> void:
	direction_x = Input.get_axis("left", "right")
	if air_is_on:
		velocity.x = direction_x * speed + wind_speed
	else:
		velocity.x = direction_x * speed

	if not is_on_floor():
		is_charging = false
		charge_time = 0.0
		return

	if Input.is_action_just_pressed("jump"):
		is_charging = true
		charge_time = 0.0

	if is_charging:
		charge_time = min(charge_time + delta, max_charge_time)

	if Input.is_action_just_released("jump") and is_charging:
		var t: float = charge_time / max_charge_time
		velocity.y = -lerp(min_jump_strength, max_jump_strength, t)
		is_charging = false
		charge_time = 0.0
		landing_timer = 0.0

func apply_gravity(delta: float) -> void:
	if is_on_floor():
		if velocity.y > 0.0:
			velocity.y = 0.0
	else:
		velocity.y += gravity_strength * delta

func animation() -> void:
	if direction_x != 0.0:
		$AnimatedSprite2D.flip_h = direction_x < 0.0

	if not is_on_floor():
		_set_anim("jump")
	elif is_charging:
		_set_anim("charging")
	elif landing_timer > 0.0:
		_set_anim("landing")
	elif direction_x != 0.0:
		_set_anim("run")
	else:
		_set_anim("idle")

func _set_anim(anim_name: String) -> void:
	if $AnimatedSprite2D.animation != anim_name:
		$AnimatedSprite2D.animation = anim_name
		$AnimatedSprite2D.play()
