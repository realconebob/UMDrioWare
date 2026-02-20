class_name EvilTimer
extends Timer

signal updated(_delta: float)

@onready var last_tl := time_left

func _init(wt: float = 1.0, aus: bool = false, os: bool = false) -> void:
	wait_time = wt
	autostart = aus
	one_shot = os
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if last_tl != time_left:
		updated.emit(delta)
		last_tl = time_left
		
	return
