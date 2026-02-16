extends TextureProgressBar

#@onready var timer: Timer = $".."
@onready var progress_bar: TextureProgressBar = $"."
@onready var timer: Timer = $Timer

signal player_died

const PACKAGE_TIME : float = 7.0

func _ready() -> void:
	timer.start(PACKAGE_TIME)
	max_value = PACKAGE_TIME

func start():
	timer.start(PACKAGE_TIME)

func pause():
	timer.paused = true

func _process(_delta: float) -> void:
	progress_bar.value = timer.time_left

func _on_timer_timeout() -> void:
	player_died.emit()
