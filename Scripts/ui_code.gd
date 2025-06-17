extends Control

@onready var health_bar = $ProgressBar
var health = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health_bar.value = health
	
