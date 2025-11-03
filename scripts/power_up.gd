extends Area2D

signal collected

func _ready():
	connect("body_entered", _on_body_entered)
	_start_despawn_timer()

func _on_body_entered(body):
	if body.name == "Brotat":
		collected.emit()
		$Brotat.move_speed() += 100
		queue_free()

func _start_despawn_timer():
	await get_tree().create_timer(200.0).timeout
	if is_inside_tree():
		queue_free()
