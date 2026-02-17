class_name TennisBall
extends RigidBody2D

@export var base_speed: int = 1200

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	return
