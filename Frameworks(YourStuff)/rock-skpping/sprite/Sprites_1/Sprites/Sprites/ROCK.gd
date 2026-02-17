extends RigidBody2D
var skipped = false
var skip_counter = 0
var inside_place = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("skip") && inside_place == true:
		skipped = true
		print("skipped")
	if skip_counter == 3:
		print("you won!")
		queue_free()
		skip_counter = 0
		#end game idk how to lol
func _on_area_2d_body_entered(body: Node2D) -> void:
	inside_place = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	inside_place = false
	skipped = false
	skip_counter += 1


func _on_bad_water_body_entered(body: Node2D) -> void:
	if skipped == false:
		print("you lost!! Bro you suck at throwing rocks fr")
		queue_free()
