extends RayCast2D

var ray_point = position
var cast = 0
@onready var ray = $"."

func _process(delta: float) -> void:
	#check if the ray is hitting a wall
	if ray.is_colliding():
		
		var collider = ray.get_collider()
		if "wall" in collider.name:
			cast = 1
	else:
		cast = 0
