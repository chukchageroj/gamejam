extends Node2D

var can_interact: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$CanvasLayer/Label.text = "Height: " + str((round($Player.position.y)))
	if $Player.position.y < -8200:
		$"Borders/2".position.x = 159.0
	if Input.is_action_just_pressed("interact") and can_interact:
		get_tree().change_scene_to_file("res://scenes/flashback_1.tscn")

func _on_camp_body_entered(body: Node2D) -> void:
	$Camp/Interact.visible = true
	can_interact = true

func _on_camp_body_exited(body: Node2D) -> void:
	$Camp/Interact.visible = false
	can_interact = false
