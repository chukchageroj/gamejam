extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and $E.visible:
		get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")


func _on_timer_timeout() -> void:
	$E.visible = true
