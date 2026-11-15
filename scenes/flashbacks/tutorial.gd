extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and $E.visible:
		get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_timer_timeout() -> void:
	$E.visible = true
