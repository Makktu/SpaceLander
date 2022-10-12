extends Area2D


func _on_TeleportRings_body_entered(body):
	if body.name == "Player":
		yield(get_tree().create_timer(4), "timeout")
		self.visible = false
