extends Node2D
@onready var ray = $RayCast2D
var ray_point = position
var mode = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("swap"):
		if mode == 0:
			mode = 1
		elif mode == 1:
			mode = 0
		
	if Input.is_action_just_pressed("shoot") and mode == 1:
		draw_grapple()
	

func _on_ray_cast_2d_draw() -> void:
	ray_point = ray.get_collision_point()

func _draw() -> void:
	draw_line(Vector2.ZERO, Vector2(ray_point), Color.GREEN, 10.0)




func draw_grapple():
	hide()
	show()
