extends Area2D

func _on_RefuellingStation_body_entered(body: Node) -> void:
	$AnimationPlayer.play("pulsate")
	$AudioStreamPlayer2D.play()
	yield($AudioStreamPlayer2D, "finished")
	queue_free()
