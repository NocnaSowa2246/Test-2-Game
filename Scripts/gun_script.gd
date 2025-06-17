extends Node2D

var bullet = preload("res://Scene/bullet.tscn")
var hook = preload("res://Scene/hook.tscn")
var bullet_speed = 1000
var bullet_instance = bullet.instantiate()
var mode = 1
@onready var gun_image = $Gun
@onready var tip = $Grapple
var ammo = 20 #bullets in magazine
var stash = 50 #Bullets total.
var hook_p = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("reload"):
		ammo = 0 #Supid way for it to work, but it works.
		reload()
	if Input.is_action_just_pressed("swap"):
		swapper()
	if ammo>0:
		if Input.is_action_just_pressed("shoot") and mode == 1:
			bullet_instance = bullet.instantiate()
			var bullet_instance = bullet.instantiate()
			bullet_instance.position = tip.global_position
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.velocity = Vector2(bullet_speed, 0).rotated(rotation)
			get_tree().get_root().add_child(bullet_instance)
			ammo = ammo - 1
			stash = stash - 1
			
	if Input.is_action_just_pressed("shoot") and mode==0 and hook_p == 1:
		hook_p = 0
		var hook_instance = hook.instantiate()
		hook_instance.position = tip.global_position
		hook_instance.rotation_degrees = rotation_degrees
		hook_instance.velocity = Vector2(bullet_speed, 0).rotated(rotation)
		get_tree().get_root().add_child(hook_instance)
		await get_tree().create_timer(3.0).timeout #Might want to change later
		hook_p = 1
		var ray_point = hook_instance.get_collision_point()
		if ray_point:
			hook_instance.velocity = Vector2(0, 0).rotated(rotation)

func reload()-> void:
	await get_tree().create_timer(3.0).timeout
	if stash<20:
		ammo = stash
	else:
		ammo = 20

func swapper()->void: #Swaps between gun and hook (Hook features not added yet)
	if Input.is_action_just_pressed("swap"):
		if mode == 0:
			mode = 1
		elif mode == 1:
			mode = 0
