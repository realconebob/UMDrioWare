class_name MovingSprite2D
extends Sprite2D

@onready var velocity: Vector2
@onready var acceleration: Vector2

func _init(initvel := Vector2.ZERO, initacc := Vector2.ZERO) -> void:
	velocity = initvel
	acceleration = initacc
	return

func _physics_process(delta: float) -> void:
	# apply velocity, then accel
	position += velocity * delta
	velocity += acceleration * delta
	return

func set_velocity(vel: Vector2) -> void:
	velocity = vel
	
func set_acceleration(acc: Vector2) -> void:
	acceleration = acc
