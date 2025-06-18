extends CharacterBody2D

@onready var gun = $Gun
@onready var grapple_hook = $Gun/Grapple
var hook = preload("res://Scene/hook.tscn")
const SPEED = 300.00
var hook_p = 0
const JUMP_VELOCITY = -500.0
var grappling = 0
var timeout = 5

func _physics_process(delta: float) -> void:
	
	
	if gun.mode == 0 and Input.is_action_just_pressed("shoot") and grappling == 0:
		hook_p = 0
		var hook_instance = hook.instantiate()
		hook_instance.position = grapple_hook.global_position
		hook_instance.rotation_degrees = rotation_degrees
		hook_instance.velocity = Vector2(1000, 0).rotated(gun.rotation)
		var timer = Timer.new()
		timer.wait_time = 5.0
		timer.one_shot = true
		timer.start()
		get_tree().get_root().add_child(hook_instance)
		var hook_pos = hook_instance.position
		var ray_point = grapple_hook.get_collision_point()
		#move player towards hook bullet
		while global_position != hook_instance.global_position and global_position.distance_to(hook_instance.global_position) > 100:
			timeout=timer.time_left
			grappling = 1
			print(global_position.distance_to(hook_instance.global_position))
			global_position = global_position.move_toward(hook_instance.global_position, delta*SPEED)
			await get_tree().create_timer(.001).timeout
			if timeout==0:
				timeout=5
				if is_instance_valid(hook_instance):
					hook_instance.queue_free()
		grappling = 0
		await get_tree().create_timer(3.0).timeout #Might want to change later
		hook_p = 1
			
			
	# Add the gravity.
	if not is_on_floor() and grappling == 0:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor() and grappling == 0:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction and grappling == 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
