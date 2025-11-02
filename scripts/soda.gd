extends Area2D

@export var damage: float = 20.0
@export var lifetime: float = 3 


var player: Node = null
func _ready():
	for body in get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(damage)

	await get_tree().create_timer(lifetime).timeout
	queue_free()
