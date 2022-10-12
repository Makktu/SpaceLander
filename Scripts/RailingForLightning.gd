extends Area2D

func _on_RailingForLightning_body_entered(body):
	if body.name == "Player" and !$"/root/Global".test_mode:
		$"../Player".game_over()

