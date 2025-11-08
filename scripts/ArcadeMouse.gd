extends Node2D

@export var speed := 250.0
@export var max_distance := 200.0
@export var center_node_path: NodePath

var center_node: Node2D

func _ready():
	if center_node_path != NodePath():
		center_node = get_node(center_node_path)

func _process(delta):
	var dir = Vector2(
		Input.get_action_strength("cursor_right") - Input.get_action_strength("cursor_left"),
		Input.get_action_strength("cursor_down") - Input.get_action_strength("cursor_up")
	).normalized()

	position += dir * speed * delta

	if center_node:
		var offset = position - center_node.global_position
		if offset.length() > max_distance:
			position = center_node.global_position + offset.normalized() * max_distance
