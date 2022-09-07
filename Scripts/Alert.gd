extends Node2D

func play_alert():
	$AudioStreamPlayer2D.play()
#	yield(get_tree().create_timer(0.5), "timeout")
