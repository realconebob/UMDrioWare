extends Node3D

@onready var left: Marker3D = $Left
@onready var right: Marker3D = $Right
@onready var up: Marker3D = $Up
@onready var down: Marker3D = $Down
@onready var visuals_container: Node = $VisualsContainer
@onready var dispenser_visuals : Array[Node] = visuals_container.get_children()

@onready var positions : Array[Marker3D] = [left, right, up, down]
@onready var available_positions : Array[Marker3D] = positions.duplicate()
@export var tape_dispenser : TapeDispenser

func _ready() -> void:
	available_positions.shuffle()
	set_new_dispenser_location()

func set_new_dispenser_location():
	if available_positions.is_empty():
		available_positions = positions.duplicate()
		available_positions.shuffle()
	var next_position : Marker3D = available_positions.pop_front()
	tape_dispenser.reparent(next_position, false)
	for sprite in dispenser_visuals:
		if sprite.name == next_position.name:
			sprite.visible = true
		else:
			sprite.visible = false


func _physics_process(_delta: float) -> void:
	if positions.is_empty():
		return
	
	#if Input.is_action_just_pressed("NewTapePosition"):
		#set_new_dispenser_location()
