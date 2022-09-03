extends Area2D

func _on_Pickup_body_entered(body: Node) -> void:	
	queue_free()

func _ready() -> void:
	$AnimationPlayer.play("embiggen")
