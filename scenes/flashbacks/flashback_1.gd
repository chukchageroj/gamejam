extends Node2D

const THEME_MUSIC = preload("res://audio/Marriage.ogg")

func _ready() -> void:
	AudioController.play_music(THEME_MUSIC)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and $E.visible:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")

func _on_timer_timeout() -> void:
	$E.visible = true
