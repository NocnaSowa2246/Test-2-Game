extends CharacterBody2D
@onready var ray = $area
var hook_p = 1
var wall = false

func _physics_process(delta: float) -> void:
	var overlaps = ray.get_overlapping_bodies()
	#stop the bullet
	if len(overlaps) > 0:
		velocity = Vector2(0, 0)
		wall = true
	else:
		wall = false
		
	move_and_slide()
