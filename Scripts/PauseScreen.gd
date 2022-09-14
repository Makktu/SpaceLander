extends Node2D

onready var pause_button = get_node("%Pause")

func _on_Resume_pressed() -> void:
	get_tree().paused = false
	self.hide()
	pause_button.show()

func _on_Pause_pressed() -> void:
	print("HERE!")
	self.show()
	pause_button.hide()
	get_tree().paused = true

func _on_StartScreen_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Game Over.tscn")

func _on_Toggle_Music_pressed() -> void:
	
	if Global.BGplaying:
		Global.BGMusic.stop()
	else:
		Global.BGMusic.play()
			
	Global.BGplaying = !Global.BGplaying
