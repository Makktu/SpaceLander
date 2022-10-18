extends Node2D

onready var pause_button = get_node("%Pause")

func _on_Resume_pressed() -> void:
	get_tree().paused = false
	self.hide()
	pause_button.show()

func _on_Pause_pressed() -> void:
	self.show()
	pause_button.hide()
	get_tree().paused = true

func _on_StartScreen_pressed() -> void:
	get_tree().paused = false
	$"/root/Global".current_level = 1
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/GameOver.tscn")

func _on_Toggle_Music_pressed() -> void:
	$"/root/Global".toggle_music_in_pause_screen()
