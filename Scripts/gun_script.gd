extends Node2D

var bullet = preload("res://Scene/bullet.tscn")
var bullet_speed = 1000
var bullet_instance = bullet.instantiate()
@onready var gun_image = $Gun

var ammo = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("reload"):
		reload()
	if ammo>0:
		if Input.is_action_just_pressed("shoot"):
			bullet_instance = bullet.instantiate()
			var bullet_instance = bullet.instantiate()
			bullet_instance.position = global_position
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.velocity = Vector2(bullet_speed, 0).rotated(rotation)
			get_tree().get_root().add_child(bullet_instance)
			ammo = ammo - 1

func reload()-> void:
	await get_tree().create_timer(3.0).timeout
	ammo=50
