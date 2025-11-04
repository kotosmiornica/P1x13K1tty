extends Area2D

@export var speed: float = 700.0
@export var food_type: String = "BadFood"
@export var is_bad: bool = true
@export var take_coins_away = true


func _ready():
	add_to_group("food")

func _process(delta):
	position.x += speed * delta
	if position.x > 2000:
		queue_free()
