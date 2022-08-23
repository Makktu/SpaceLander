extends Area2D

func _on_Pickup_body_entered(body: Node) -> void:

	queue_free()

func _on_Timer_timeout() -> void:
	pass
