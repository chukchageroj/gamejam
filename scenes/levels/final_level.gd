extends Node2D

func _ready() -> void:
	AudioController.play_music(null)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Player.position.y < -1350:
		$"Borders/2".position.x = 159.0
	if $Player.position.x > 336:
		get_tree().change_scene_to_file("res://scenes/levels/final.tscn")
