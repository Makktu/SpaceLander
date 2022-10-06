extends Node2D

var move_direction = -1

var starting_pos = position.y
var ending_pos = -2496

func _physics_process(delta: float) -> void:
	if position.y > starting_pos + 10:
		move_direction = -1
	if position.y < ending_pos:
		move_direction = 1
	position.y += move_direction

func _on_LightningVertical_body_entered(body: Node) -> void:
	if body.name == "Player":
		if !$"/root/Global".test_mode:
			$"../../Player".game_over()
