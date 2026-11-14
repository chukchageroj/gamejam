extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Player.position[1] < $Player/Camera2D.limit_top:
		$Player/Camera2D.limit_top -= 480
		$Player/Camera2D.limit_bottom -= 480
	if $Player.position[1] > $Player/Camera2D.limit_bottom:
		$Player/Camera2D.limit_top += 480
		$Player/Camera2D.limit_bottom += 480
	$Player/Camera2D/Label.text = "Charge time: " + str($Player.charge_time) + "\nHeight: " + str((round($Player.position.y) + 47.0) / -16) 
