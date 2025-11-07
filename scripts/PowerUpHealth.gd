extends Area2D

signal collected

@export var boost_amount: float = 100
@export var boost_duration: float = 5.0

func _ready():
	connect("body_entered", _on_body_entered)
	_start_despawn_timer()

func _on_body_entered(body):
	if body.name == "Brotat":
		Global.monster_caught = true
		collected.emit()
		body.health += boost_amount
		queue_free()
		_revert_speed_later(body, boost_amount, boost_duration)

func _revert_speed_later(body, amount, duration):
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = duration
	add_child(timer)
	timer.start()
	
	timer.timeout.connect(func():
		if body and body.is_inside_tree():
			body.health -= amount
		timer.queue_free()
		)
	

func _on_boost_timeout(body, amount):
	if body and body.is_inside_tree():
		body.health -= amount


func _start_despawn_timer():
	await get_tree().create_timer(200.0).timeout
	if is_inside_tree():
		queue_free()
