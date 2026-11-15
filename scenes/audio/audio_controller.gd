extends Node

@onready var bg_music: AudioStreamPlayer = $BGMusic

func _ready() -> void:
	bg_music.bus = "Music"

func play_music(new_stream: AudioStream, should_loop: bool = false) -> void:
	if bg_music.stream == new_stream and bg_music.playing:
		return
	
	if new_stream == null:
		bg_music.stop()
		bg_music.stream = null
		return
	
	if "loop" in new_stream:
		new_stream.loop = should_loop
	
	bg_music.stream = new_stream
	bg_music.play()

func play_sfx(sound: AudioStream) -> void:
	if sound == null:
		return

	var sfx_player = AudioStreamPlayer.new()
	sfx_player.stream = sound
	sfx_player.bus = "SFX"
	add_child(sfx_player)
	sfx_player.play()

	await sfx_player.finished
	sfx_player.queue_free()
