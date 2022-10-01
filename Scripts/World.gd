extends Node2D

# END OF LEVEL 0 / TRANSFER TO LEVEL 1 & PLAYER SETUP THERE
func transfer_player():
	$CanvasLayer/SceneTransitionRect/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	$Player.position.x = 8230
	$Player.position.y = -2900
	yield(get_tree().create_timer(2), "timeout")
	$CanvasModulate.visible = false
	$CanvasModulate2.visible = true
	$"Player".change_lighting(1, 2)
	$CanvasLayer/SceneTransitionRect/AnimationPlayer.play_backwards("fade")
	yield(get_tree().create_timer(3), "timeout")
	$"Player/Camera2D".zoom_in_or_out("IN", 550, 0.002)
#	$"Player/Camera2D".zoom = Vector2(1,1)
	$"Player/GUI".visible = true	
	$"Player/FadeOut".play_backwards("fadeout")
	$"Player".just_starting = true
	yield(get_tree().create_timer(3), "timeout")
	$"Player/Camera2D".zoom_in_or_out("OUT", 130, 0.02)


