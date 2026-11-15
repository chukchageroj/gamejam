extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Title.modulate.a = 0.0
	$AnimationPlayer.play('new_animation')
	await $AnimationPlayer.animation_finished
	var tween = create_tween()
	tween.tween_property($Title, "modulate:a", 1.0, 5.0)
	await get_tree().create_timer(10.0).timeout
	$E.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $E.visible and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/flashbacks/titles_1.tscn")
