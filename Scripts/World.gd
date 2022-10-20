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
func transfer_player():
# warning-ignore:return_value_discarded

	get_tree().change_scene("res://Scenes/World.tscn")	
	
func complete_transfer():
	$Player/Sprite.visible = true
	$"Player/GUI".visible = true
	$"Player".just_starting = true	
	if !dev_transfer:
		dev_transfer = false



func _on_EndGameTrigger_body_entered(body: Node) -> void:
	$"/root/Global".won_the_game()
