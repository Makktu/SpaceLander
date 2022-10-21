extends StaticBody2D

func _on_EndGameTrigger_body_entered(body: Node) -> void:
	if body.name == "Player":
		$"../../Player".gameOver = true
		yield(get_tree().create_timer(3), "timeout")
		$FinalMessage/AnimationPlayer.play("fade_up")
		yield(get_tree().create_timer(10), "timeout")
		$FinalMessage/AnimationPlayer.play_backwards("fade_up")
