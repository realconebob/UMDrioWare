extends Game

@onready var intensity: float = get_intensity()

func _start_game() -> void:
	$"The Guy"._setup(intensity)
	$"The Guy".start()
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	return
