extends Control

@onready var PopUpWindow = $Window

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var settings: Panel = $Settings


func _ready() -> void:
	main_buttons.visible = true
	settings.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

#Start, settings -> transition to another scene
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test-scene.tscn")




func _on_settings_2_pressed() -> void:
	main_buttons.visible = false
	settings.visible = true


func _on_exit_pressed() -> void:
	PopUpWindow.show()
	main_buttons.visible = false


func _on_yes_button_pressed() -> void:
	get_tree().quit()

	
func _on_cross_icon_button_pressed() -> void:
	settings.visible = false
	main_buttons.visible = true




func _on_no_button_pressed() -> void:
	PopUpWindow.hide()
