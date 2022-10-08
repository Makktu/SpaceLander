extends Node2D

var move_direction = 1

var starting_pos = 6330
var ending_pos = 9704

func _physics_process(delta: float) -> void:
	if position.x <= starting_pos:
		move_direction = 1
	if position.x >= ending_pos:
		move_direction = -1
	position.x += move_direction


func _on_LightningEnemy_body_entered(body: Node) -> void:
	if body.name == "Player":
		if !$"/root/Global".test_mode:
			$"../../Player".game_over()
