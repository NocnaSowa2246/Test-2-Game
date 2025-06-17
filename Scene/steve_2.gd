extends Sprite2D

@onready var steve_2: Sprite2D = $"."

func _process(delta):
	steve_2.rotation += deg_to_rad(2)
