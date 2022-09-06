extends Node2D

func _ready() -> void:
	# return to START screen after 10 seconds if no button pressed
	yield(get_tree().create_timer(10.0), "timeout")
	get_tree().change_scene("res://Scenes/Game Over.tscn")


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/Game Over.tscn")

