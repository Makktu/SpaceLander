extends Area2D

func _on_Portal_body_entered(body: Node) -> void:
	$NearingPortal.play()


func _on_CentreOfPortal_body_entered(body: Node) -> void:
	$NearingPortal.stop()
	$EnteringPortal.play()
	$Timer.start()



func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Won.tscn")
