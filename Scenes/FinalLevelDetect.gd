extends Area2D

func _on_FinalLevelDetect_body_entered(_body: Node) -> void:
	$"/root/Global".current_level = 3
