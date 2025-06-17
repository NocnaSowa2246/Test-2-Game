extends CollisionShape2D

@onready var collision_shape_2d: CollisionShape2D = $"."

func _integrate_forces(state):
	state.transform.rotation += 0.01
