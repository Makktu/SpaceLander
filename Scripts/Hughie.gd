extends Area2D

func _on_Hughie_body_entered(body: Node) -> void:
	$HughieVoice.play()
		
