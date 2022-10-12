extends Node2D

var dev_transfer = false
var fuel_carried_over = null

func _unhandled_input(event):
	# DEVELOPER CONTROLS - CORRESPONDING KEY MOVES PLAYER INSTANTLY BETWEEN LEVELS
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_9:
			$"/root/Global".test_mode = !$"/root/Global".test_mode
			print("Test Mode: ", $"/root/Global".test_mode)
		# PRESS '2' TO GO TO LEVEL 2
		if event.pressed and event.scancode == KEY_2:
			$"/root/Global".current_level = 2
			dev_transfer = true
			transfer_player()
		if event.pressed and event.scancode == KEY_1:
		# PRESS '1' TO GO TO LEVEL 1
			$"/root/Global".current_level = 1
			dev_transfer = true
			transfer_player()
			

# END OF LEVEL 0 / TRANSFER TO LEVEL 1 & PLAYER SETUP THERE
func transfer_player(fuel_amount = 3000):
	fuel_carried_over = fuel_amount
	get_tree().change_scene("res://Scenes/World.tscn")	
	
func complete_transfer():
	if $"/root/Global".current_level == 2:		
		$CanvasModulate.visible = false
		$CanvasModulate2.visible = true
		$Player/Light2D.energy = 1
		$Player/Light2D.texture_scale = 3
	yield(get_tree().create_timer(3), "timeout")
	$Player/Sprite.visible = true
#	$"Player/FadeOut".play_backwards("fadeout")
	$"Player/GUI".visible = true
	$"Player".just_starting = true	
	if !dev_transfer:
#		$"Player/Camera2D".zoom_in_or_out("IN", 550, 0.002)
		dev_transfer = false
#	$"Player/Camera2D".zoom_in_or_out("OUT", 130, 0.02)
	print($Player/Light2D.energy, " / ", $Player/Light2D.texture_scale)
