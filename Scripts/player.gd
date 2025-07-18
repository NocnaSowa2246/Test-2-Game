extends CharacterBody2D

@onready var gun = $Gun
@onready var grapple_hook = $Gun/Grapple
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var hook = preload("res://Scene/hook.tscn")
const SPEED = 500.00
var hook_p = 0
const JUMP_VELOCITY = -500.0
var grappling = 0
var run = 1

func _physics_process(delta: float) -> void:
	#most of this is just for the grappling hook
	if gun.mode == 0 and Input.is_action_just_pressed("shoot") and grappling == 0 and grapple_hook.cast == 1:
		hook_p = 0
		var hook_instance = hook.instantiate()
		hook_instance.position = grapple_hook.global_position
		hook_instance.rotation_degrees = rotation_degrees
		hook_instance.velocity = Vector2(1000, 0).rotated(gun.rotation)
		get_tree().get_root().add_child(hook_instance)
		var hook_pos = hook_instance.position
		var ray_point = grapple_hook.get_collision_point()
		#move player towards hook bullet
		while global_position != hook_instance.global_position and global_position.distance_to(hook_instance.global_position) > 100:
			grappling = 1
			print(global_position.distance_to(hook_instance.global_position))
			global_position = global_position.move_toward(hook_instance.global_position, delta*1050)
			await get_tree().create_timer(.001).timeout
			if hook_instance.position.y > 700 or hook_instance.position.y < -700:
				hook_instance.queue_free()
				break
		grappling = 0
		hook_instance.free()
		await get_tree().create_timer(3.0).timeout #Might want to change later
		hook_p = 1
			
			
	# Add the gravity.
	if not is_on_floor() and grappling == 0:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor() and grappling == 0:
		velocity.y = JUMP_VELOCITY
	# If the jump button is let go, you won't go as high.
	if not Input.is_action_pressed("jump") and velocity.y < 0:
		velocity.y = 0
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction and grappling == 0:
		velocity.x = direction * SPEED * run
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	if direction > 0:
			animated_sprite_2d.flip_h = false
	
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	
	
	
	
	
	
	
	

	
	if Input.is_key_pressed(KEY_SHIFT):
		run = 1.5
	else:
		run = 1
	move_and_slide()
	
func _process(float):
	if position.x > 8689:
		if position.x < 8881:
			if position.y > -162:
				if position.y < 222:
					get_tree().change_scene_to_file("res://Scene/world_2.tscn")
