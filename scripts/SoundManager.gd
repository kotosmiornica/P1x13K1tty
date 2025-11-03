extends Node

@export var hit_sound: AudioStream
@export var max_simultaneous_hits: int = 5

var current_hits: int = 0

func play_hit_sound():
	if hit_sound == null:
		push_warning("SoundManager: hit_sound not assigned!")
		return

	var sfx = AudioStreamPlayer2D.new()
	sfx.stream = hit_sound
	sfx.volume_db = randf_range(-6, 0)
	sfx.pitch_scale = randf_range(0.9, 1.1)
	get_tree().current_scene.add_child(sfx)
	sfx.play()

	var duration = sfx.stream.get_length() if sfx.stream else 0.5
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = duration
	timer.connect("timeout", Callable(sfx, "queue_free"))
	sfx.add_child(timer)
	timer.start()
