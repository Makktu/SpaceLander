extends Node2D

var dev_transfer = false

func _unhandled_input(event):
	# DEVELOPER CONTROLS - CORRESPONDING KEY MOVES PLAYER INSTANTLY BETWEEN LEVELS
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_9:
			$"/root/Global".test_mode = !$"/root/Global".test_mode
			print("Test Mode: ", $"/root/Global".test_mode)
		# PRESS '2' TO GO TO LEVEL 2
		if event.pressed and event.scancode == KEY_2:
			dev_transfer = true
			transfer_player()
		if event.pressed and event.scancode == KEY_1:
		# PRESS '1' TO GO TO LEVEL 1
			get_tree().change_scene("res://Scenes/World.tscn")

# END OF LEVEL 0 / TRANSFER TO LEVEL 1 & PLAYER SETUP THERE
func transfer_player():
	$CanvasLayer/SceneTransitionRect/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	$Player.position.x = 8045
	$Player.position.y = -3239
	$ParallaxBackground/ParallaxLayer/Sprite.texture = load("res://Assets/Starfield1.png")
	yield(get_tree().create_timer(2), "timeout")
	$CanvasModulate.visible = false
	$CanvasModulate2.visible = true
	$"Player".change_lighting(1, 2)
	$CanvasLayer/SceneTransitionRect/AnimationPlayer.play_backwards("fade")
	yield(get_tree().create_timer(3), "timeout")
	if !dev_transfer:
		$"Player/Camera2D".zoom_in_or_out("IN", 550, 0.002)
		$"Player".just_starting = true
		dev_transfer = false
	yield(get_tree().create_timer(3), "timeout")
	$"Player/GUI".visible = true	
	$"Player/FadeOut".play_backwards("fadeout")
	$"Player/Camera2D".zoom_in_or_out("OUT", 130, 0.02)



