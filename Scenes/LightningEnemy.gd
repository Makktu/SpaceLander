extends KinematicBody2D

var lightning_move_speed = 2

func _physics_process(delta: float) -> void:
	position.x += lightning_move_speed




func _on_RailingForLightning_body_exited(body: Node) -> void:
	lightning_move_speed = -lightning_move_speed


func _on_SoundProximity_body_entered(body: Node) -> void:
	$AudioStreamPlayer2D.play()
