extends Node2D

const THEME_MUSIC = preload("res://audio/Winter_wind.ogg")

var can_interact: bool = false
var checkpoint_reached: bool = false


func _ready() -> void:
	AudioController.play_music(THEME_MUSIC, true)
	$Player.air_is_on = true

func _process(_delta: float) -> void:
	$CanvasLayer/Label.text = "Height: " + str(int(round((round($Player.position.y) + 48) / -16)) + 510) + ' m'
	if not checkpoint_reached and $Player.position.y < -8200:
		checkpoint_reached = true
		$"Borders/2".position.x = 159.0
		AudioController.play_sfx(preload("res://audio/New_checkpiont_sound.wav"))
	if Input.is_action_just_pressed("interact") and can_interact:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/flashbacks/flashback_2.tscn")

func _on_camp_body_entered(_body: Node2D) -> void:
	$Camp/Interact.visible = true
	can_interact = true

func _on_camp_body_exited(_body: Node2D) -> void:
	$Camp/Interact.visible = false
	can_interact = false
