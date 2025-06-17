extends CharacterBody2D

@onready var gun = $Gun
@onready var grapple_hook = $Gun/Grapple
const SPEED = 300.00
const JUMP_VELOCITY = -500.0
var grappling = 0


func _physics_process(delta: float) -> void:
	if gun.mode == 0 and Input.is_action_just_pressed("shoot") and grappling == 0:
		var ray_point = grapple_hook.get_collision_point()
		while global_position != grapple_hook.ray_point:
			grappling = 1
			global_position = global_position.move_toward(ray_point, delta*SPEED)
			await get_tree().create_timer(.001).timeout
		grappling = 0
			
	# Add the gravity.
	if not is_on_floor() and grappling == 0:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor() and grappling == 0:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction and grappling == 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
