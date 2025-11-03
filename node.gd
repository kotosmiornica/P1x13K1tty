extends Node

@export var hit_sound: AudioStream
@export var max_simultaneous_hits: int = 5

var current_hits: int = 0

func play_hit_sound():
	if current_hits >= max_simultaneous_hits:
		return
	var sfx = AudioStreamPlayer2D.new()
	sfx.stream = hit_sound
	sfx.volume_db = randf_range(-2, 0)
	sfx.pitch_scale = randf_range(0.6, 1.8)
	add_child(sfx)
	sfx.play()
	current_hits += 1
	sfx.connect("finished", Callable(self, "_on_sfx_finished").bind(sfx))
