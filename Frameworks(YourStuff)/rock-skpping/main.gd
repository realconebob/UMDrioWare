extends Game
@onready var rock: RigidBody2D = $ROCK

func _start_game():
	Engine.time_scale = get_intensity()
