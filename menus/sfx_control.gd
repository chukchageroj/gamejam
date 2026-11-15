extends HSlider

@export var sfx_bus: String = "SFX"

var sfx_bus_id: int = -1


func _ready() -> void:
	sfx_bus_id = AudioServer.get_bus_index(sfx_bus)
	if sfx_bus_id == -1:
		push_error("%s: шина '%s' не найдена" % [name, sfx_bus])
		return

	var current_db := AudioServer.get_bus_volume_db(sfx_bus_id)
	var is_muted := AudioServer.is_bus_mute(sfx_bus_id)
	set_value_no_signal(0.0 if is_muted else db_to_linear(current_db))


func _on_value_changed(new_value: float) -> void:
	if sfx_bus_id == -1:
		return

	if new_value <= 0.001:
		AudioServer.set_bus_mute(sfx_bus_id, true)
		return

	AudioServer.set_bus_mute(sfx_bus_id, false)
	AudioServer.set_bus_volume_db(sfx_bus_id, maxf(linear_to_db(new_value), -80.0))
