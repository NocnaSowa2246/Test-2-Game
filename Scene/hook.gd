extends CharacterBody2D
@onready var ray = $area
@onready var tip = $"../Grapple"
var hook_p = 0
var wall = false

func _physics_process(delta: float) -> void:
	var overlaps = ray.get_overlapping_bodies()
	#stop the bullet
	if len(overlaps) > 0:
		velocity = Vector2(0, 0)
	#if Input.is_action_just_pressed("shoot")and hook_p == 1:
		#hook_p = 0
		#var hook_instance = $".".instantiate()
		#hook_instance.position = tip.global_position
		#hook_instance.rotation_degrees = rotation_degrees
		#hook_instance.velocity = Vector2(1000, 0).rotated(rotation)
		#get_tree().get_root().add_child(hook_instance)
		#await get_tree().create_timer(3.0).timeout #Might want to change later

		
		
	hook_p = 1
		
	move_and_slide()
