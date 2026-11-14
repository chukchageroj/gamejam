extends HSlider

@export var sfx_bus: String

var sfx_bus_id

func _ready():
	sfx_bus_id = AudioServer.get_bus_index(sfx_bus) 

func _on_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(sfx_bus_id, db)
