extends Area2D

func _on_RailingForLightning_body_entered(body):
	if body.name == "Player":
		$"../Player".game_over()

