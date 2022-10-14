extends Node2D

var move_direction = 0.2
var last_move = move_direction

func _physics_process(delta: float) -> void:
	position.x += move_direction
	if move_direction != last_move:
		print("CHANGED!!!")
