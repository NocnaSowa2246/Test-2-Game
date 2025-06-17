extends Sprite2D

@onready var steve: Sprite2D = $"."
@onready var timer: Timer = $Timer

func _physics_process(delta):
	steve.rotation += 0.01
