extends Node2D
@onready var GameRoot: MicroGameRoot = $".."

@onready var rich_text_label: RichTextLabel = $Description
@onready var timer_words: RichTextLabel = $TimerWords

var timer = 1.0
var won = false

signal time_done
@onready var player: Player = $SubViewportContainer/SubViewport/Player
@onready var spray_wall: StaticBody3D = $SubViewportContainer/SubViewport/SprayWall

var started = false
func _process(delta: float) -> void:
	if !started: return
	if timer_words.visible: 
		if timer > 0:
			timer = max(timer - delta, 0)
		else:
			timer = 0
			time_done.emit()
	timer_words.text = str(snapped(timer, .01))
	
func _on_game_root_start_game() -> void:
	started = true
	player.started = true
	rich_text_label.show()
	
	await get_tree().create_timer(1.0).timeout #wait for instructions
	rich_text_label.hide()
	timer_words.show()
	started = true
	spray_wall.total_needed = 1/spray_wall.total_needed
	timer = 2/GameRoot.get_intensity()
	await time_done
	player.started = false
	GameRoot.end_game.emit(won) #defaults to false if button is not pressed
