extends AnimatedSprite2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"."
var AnimatedSprite: AnimatedSprite2D

func _process(delta):
 AnimatedSprite2D.rotation += deg_to_rad(2)
