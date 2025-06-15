extends Area2D

var speed = 1000

func _physics_process(delta):
	position.x+= speed * delta
