extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and $E.visible:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/flashbacks/titles_2.tscn")

func _on_timer_timeout() -> void:
	$E.visible = true
