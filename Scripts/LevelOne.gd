extends Node2D

func _ready() -> void:
#	$"/root/Global".BGMusic.stop()
#	$"/root/Global".BGMusic.stream = load("res://Assets/lander0.mp3")
#	$"/root/Global".BGMusic.play()
	$"/root/Global".BGMusic.stop()
	$"/root/Global".BGMusic2.play()
	$Player.velocity.y = move_toward(0, -150, 0)
