extends Control

signal upgrade_selected(upgrade_name: String)


func _ready() -> void:
	$CanvasLayer.visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	mouse_filter = MOUSE_FILTER_IGNORE
	if Global.monster_caught == true:
		$CanvasLayer.visible = true
	else:
		printerr("not found")
		

func _on_damage_pressed() -> void:
	print("Damage button pressed!")
	emit_signal("upgrade_selected", "damage")
	queue_free()


func _on_movementspeed_pressed() -> void:
	print("Speed button pressed!")
	emit_signal("upgrade_selected", "movement speed")
	queue_free()


func _on_health_pressed() -> void:
	print("Health button pressed!")
	emit_signal("upgrade_selected", "health")
	queue_free()
