extends HSlider

@export_enum("Music", "SFX") var bus_name: String = "Music"

var bus_id: int = -1

func _ready() -> void:
	bus_id = AudioServer.get_bus_index(bus_name)
	if bus_id == -1:
		push_error("%s: шина '%s' не найдена" % [name, bus_name])
		return
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_id))

func _on_value_changed(new_value: float) -> void:
	if bus_id == -1:
		return
	if new_value <= 0.001:
		AudioServer.set_bus_mute(bus_id, true)
		return
	AudioServer.set_bus_mute(bus_id, false)
	AudioServer.set_bus_volume_db(bus_id, maxf(linear_to_db(new_value), -80.0))
