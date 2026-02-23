class_name MovingScreenSprite2D
extends MovingSprite2D

@onready var notifier := $Notifier

func _init(initvel := Vector2.ZERO, initacc := Vector2.ZERO) -> void:
	super._init(initvel, initacc)

func _ready() -> void:
	assert(notifier != null, "<MovingScreenSprite2D::_ready> Error: Notifier is null for some reason")
	notifier.rect = get_rect()
	notifier.screen_exited.connect(queue_free)
	
	return
