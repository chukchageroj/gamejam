extends Node2D

const THEME_MUSIC = preload("res://audio/MissUp_theme.ogg")

func _ready() -> void:
	AudioController.play_music(THEME_MUSIC, true)
	$Title.modulate.a = 0.0
	$AnimationPlayer.play('new_animation')
	await $AnimationPlayer.animation_finished
	var tween = create_tween()
	tween.tween_property($Title, "modulate:a", 1.0, 5.0)
	await get_tree().create_timer(10.0).timeout
	$E.visible = true

func _process(_delta: float) -> void:
	if $E.visible and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/flashbacks/titles_1.tscn")
