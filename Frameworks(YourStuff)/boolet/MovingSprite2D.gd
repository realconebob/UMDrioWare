class_name MovingSprite2D
extends Sprite2D

@onready var velocity: Vector2 = Vector2.ZERO
@onready var acceleration: Vector2 = Vector2.ZERO

func _init() -> void:
	return

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
