extends Node2D

var bullet = preload("res://Scene/bullet.tscn")
var hook = preload("res://Scene/hook.tscn")
var bullet_speed = 1000
var bullet_instance = bullet.instantiate()
var mode = 0
@onready var gun_image = $Gun
@onready var tip = $Grapple
var ammo = 20 #bullets in magazine
var stash = 50 #Bullets total.
var hook_p = 1
var shootable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("reload"):
		ammo = 0 #Supid way for it to work, but it works.
		reload()
	if Input.is_action_just_pressed("swap"):
		swapper()
	if ammo>0:
		if Input.is_action_just_pressed("shoot") and mode == 1 and shootable:
			bullet_instance = bullet.instantiate()
			var bullet_instance = bullet.instantiate()
			bullet_instance.position = tip.global_position
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.velocity = Vector2(bullet_speed, 0).rotated(rotation)
			get_tree().get_root().add_child(bullet_instance)
			ammo = ammo - 1
			stash = stash - 1
			shootable = false
			await get_tree().create_timer(.25).timeout
			shootable = true

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
