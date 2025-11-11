extends Area2D

var bullet_scene = preload("res://scenes/testbullet.tscn")

@onready var pivot = $weapon/Sprite2D/pivot
@onready var bang = $Bang

@export var fire_rate := 0.12
var can_fire := true

func _physics_process(_delta: float) -> void:
	var dir := Input.get_vector("cursor_left", "cursor_right", "cursor_up", "cursor_down")

	if dir != Vector2.ZERO and can_fire:
		rotation = dir.angle()
		fire(dir.normalized())

func fire(dir: Vector2) -> void:
	can_fire = false
	var bullet = bullet_scene.instantiate()
	bullet.global_position = pivot.global_position
	bullet.rotation = dir.angle()
	bullet.direction = dir
	get_tree().current_scene.add_child(bullet)
	bang.play()
	await get_tree().create_timer(fire_rate).timeout
	can_fire = true
