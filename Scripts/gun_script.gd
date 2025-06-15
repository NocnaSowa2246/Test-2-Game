extends Node2D

var bullet = preload("res://Scene/bullet.tscn")
var bullet_speed = 100


var speed = 1000

func _physics_process(delta):
	position.x+= speed * delta

@onready var gun_image = $Gun

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = global_position
		bullet_instance.rotation_degrees = rotation_degrees
		#bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
