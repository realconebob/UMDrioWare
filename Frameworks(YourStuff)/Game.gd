class_name Game extends Node2D

var game_manager: GameManager

signal game_finished(game_root : Node, won : bool)
signal start_game
signal end_game(won : bool)

func _ready() -> void:
	if get_parent() is not GameManager:
		_start_game()
	else:
		game_manager = get_parent()

func _start_game(): #this function is automatically called when the scene transitions in
	end_game.connect(_end_game, 1)
	start_game.emit()

func _end_game(won : bool): #you cann this funciton or emit the end_game signal to close your game(include if the player has won or lost)
	MainCamera.add_trauma(.1,Vector2(-1,0)) #camera shake
	game_finished.emit(self, won)

func get_intensity(): #returns the time_value
	if game_manager: 
		return game_manager.game_intensity
	else:
		return 1.0 #testing mode
		
