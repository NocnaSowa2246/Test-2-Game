extends CharacterBody2D


func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		
		
		
		
	move_and_slide()


func _on_defend_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_attack_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
