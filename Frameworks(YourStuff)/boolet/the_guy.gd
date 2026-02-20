extends Node2D

var intensity: float
var is_setup: bool = false

@onready var shotty: Sprite2D = $Shotty
@onready var shotty_ogpos := Vector2(shotty.position)

func _setup(inten: float) -> void:
	intensity = inten
	is_setup = true
	return

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start() -> void:
	if !is_setup:
		assert(false,"<\"The Guy\"::start> Error: The Guy was not set up with setup \"The Guy\"::setup")
	
	var boomtime: float = (5 / intensity)
	var boomtimer := EvilTimer.new(boomtime, true, true)
	
	boomtimer.updated.connect(
		func(_delta: float) -> void:
			var _intensity: float = (boomtime - boomtimer.time_left)
			shotty.position = Vector2(
				shotty_ogpos.x + _delta * randf_range(-_intensity * shotty.texture.get_width() / 2, _intensity * shotty.texture.get_width() / 2), 
				shotty_ogpos.y + _delta * randf_range(-_intensity * shotty.texture.get_height() / 2, _intensity * shotty.texture.get_height() / 2)
			)
			return
	)
	add_child(boomtimer)
	boomtimer.start()
	await boomtimer.timeout
	return
