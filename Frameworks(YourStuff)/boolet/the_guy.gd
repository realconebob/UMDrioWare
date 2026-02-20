extends Node2D

@onready var intensity: float
@onready var is_setup: bool = false

@onready var shotty: MovingSprite2D = $Shotty
@onready var shotty_ogpos := Vector2(shotty.position)
@onready var boomtime: float
@onready var boomtimer: EvilTimer

func _setup(inten: float) -> void:
	intensity = inten
	
	boomtime = (5 / intensity)
	boomtimer = EvilTimer.new(boomtime, true, true)
	boomtimer.updated.connect(
		func(_delta: float) -> void:
			var _intensity: float = (boomtime - boomtimer.time_left) / boomtime
			var _x := _intensity * shotty.texture.get_width() / 2
			var _y := _intensity * shotty.texture.get_height() / 2
			shotty.position = Vector2(
				shotty_ogpos.x + randf_range(-_x, _x),
				shotty_ogpos.y + randf_range(-_y, _y)
			)
			return
	)
	add_child(boomtimer)
	
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
	
	boomtimer.start()
	await boomtimer.timeout
	boomtimer.queue_free()
	
	const boomvel := 3750
	for child: Node in self.get_children():
		if child is MovingSprite2D: # Redundant but good practice
			var real := (child as MovingSprite2D)
			real.set_velocity(-boomvel * (shotty.position - real.position).normalized()) 
	shotty.set_velocity(boomvel * Vector2(-1, 0).normalized())
	
	return
