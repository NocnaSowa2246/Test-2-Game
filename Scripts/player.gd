extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var damage = $Defend
@onready var ui = $Camera2D/playerui

func _physics_process(delta: float) -> void:
	# Add the gravity.
	damage_check()
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func damage_check():
	var overlaps = damage.get_overlapping_areas()
	print(overlaps)
	for overlap in overlaps:
		if overlap.name == "Attack":
			ui.health = 0
			position = Vector2(572, 348)
