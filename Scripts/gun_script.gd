extends Node2D

var bullet = preload("res://Scene/bullet.tscn")
var bullet_speed = 1000
var bullet_instance = bullet.instantiate()
var _bullet = preload("res://Scene/bullet.tscn")
@onready var gun_image = $Gun

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):

		bullet_instance = bullet.instantiate()

<<<<<<< Updated upstream
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = global_position
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.velocity = Vector2(bullet_speed, 0).rotated(rotation)
		get_tree().get_root().add_child(bullet_instance)
=======
func swapper()->void: #Swaps between gun and hook (Hook features not added yet)
	if Input.is_action_just_pressed("swap"):
		if mode == 0:
			mode = 1
		elif mode == 1:
			mode = 0
			
>>>>>>> Stashed changes
