extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Player.position.y < -1340:
		$"Borders/2".position.x = 159.0


func _on_area_2d_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.
