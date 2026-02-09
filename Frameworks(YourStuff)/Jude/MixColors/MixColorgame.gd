extends Node2D
@onready var GameRoot: MicroGameRoot = $".."

@onready var Description: RichTextLabel = $Description
@onready var timer_words: RichTextLabel = $TimerWords

var timer = 1.0
var won = false

signal time_done

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
	Description.show()
	
	await get_tree().create_timer(1.0).timeout #wait for instructions
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Description.hide()
	timer_words.show()
	started = true

	timer = 7/GameRoot.get_intensity()
	await time_done
	GameRoot.end_game.emit(won) #defaults to false if button is not pressed
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
