extends Node2D

func _physics_process(delta: float) -> void:
	position.x += 3

func _on_Back_pressed() -> void:
	get_tree().change_scene("res://Scenes/Game Over.tscn")
