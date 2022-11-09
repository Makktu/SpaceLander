extends Node2D


func _ready():
	$AnimationPlayer.play("fade_in")


func _on_Timer_timeout():
	$AnimationPlayer.play_backwards("fade_in")
	$Timer2.start()

func _on_Timer2_timeout():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
