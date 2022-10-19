extends Area2D


func _on_FinalDescent_body_entered(body: Node) -> void:
	$"/root/Global".play_next_track(true)
