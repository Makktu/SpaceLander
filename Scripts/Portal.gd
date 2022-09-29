extends Area2D

func _on_CentreOfPortal_body_entered(body: Node) -> void:
	if body.name == "Player":
		$"../Player/Camera2D".zoom = Vector2(1,1)
		$"../Player".velocity.y = move_toward(0, 0, 0)
		$"../Player".velocity.x = move_toward(0, 0, 0)		
		$"../Player/GUI".visible = false
		$EnteringPortal.play()
		$"../Player/FadeOut".play("fadeout")
		$Timer.start()



func _on_Timer_timeout():
#	$"../".transfer_player()
	get_tree().change_scene("res://Scenes/Won.tscn")
#	$"../Player".position.x = 651
#	$"../Player".position.y = -1200
#	yield(get_tree().create_timer(3), "timeout")
#	$"../Player/FadeOut".play("fadein")
