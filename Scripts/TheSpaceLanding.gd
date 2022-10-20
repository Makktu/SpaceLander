extends StaticBody2D

func _on_EndGameTrigger_body_entered(body: Node) -> void:
	if body.name == "Player":
		$"../../Player".gameOver = true
		yield(get_tree().create_timer(3), "timeout")
		$FinalMessage.visible = true
