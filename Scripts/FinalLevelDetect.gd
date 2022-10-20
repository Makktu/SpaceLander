extends Area2D


func _on_FinalDescent_body_entered(body: Node) -> void:
	$"/root/Global".play_next_track(true)
	yield(get_tree().create_timer(8), "timeout")
	$"../FinalLanding/TheSpaceLanding/MeshInstance2D/AnimationPlayer".play("glowing_pad")
	$"../Player/Camera2D".zoom_in_or_out("OUT", 100, 0.1)
	yield(get_tree().create_timer(20), "timeout")
	$"../Player/Camera2D".zoom_in_or_out("IN", 110, 0.1)
	
