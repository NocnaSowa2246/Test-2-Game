extends Area2D

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
