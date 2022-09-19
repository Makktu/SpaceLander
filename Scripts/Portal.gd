extends Area2D

func _on_Portal_body_entered(body: Node) -> void:
	$NearingPortal.play()


func _on_CentreOfPortal_body_entered(body: Node) -> void:
	$NearingPortal.stop()
	$EnteringPortal.play()
	$Timer.start()



func _on_Timer_timeout():
#	$"/root/Global".player.get_parent().remove_child(player)
	get_tree().change_scene("res://Scenes/Won.tscn")
