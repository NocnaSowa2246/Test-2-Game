extends Node2D

<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
var bullet = preload("res://Scene/bullet.tscn")
var bullet_speed = 1000
var bullet_instance = bullet.instantiate()
=======
var _bullet = preload("res://Scene/bullet.tscn")
var bullet_speed = 100

>>>>>>> Stashed changes
=======
var _bullet = preload("res://Scene/bullet.tscn")
var bullet_speed = 100

>>>>>>> Stashed changes
=======
var _bullet = preload("res://Scene/bullet.tscn")
var bullet_speed = 100

>>>>>>> Stashed changes
@onready var gun_image = $Gun

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
<<<<<<< Updated upstream
		bullet_instance = bullet.instantiate()
=======
		var bullet_instance = bullet.instantiate()

<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
		bullet_instance.position = global_position
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.velocity = Vector2(bullet_speed, 0).rotated(rotation)
		get_tree().get_root().add_child(bullet_instance)
