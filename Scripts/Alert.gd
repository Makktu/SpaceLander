extends Node2D

func play_alert():
#	$Timer.start()
	for n in 4:
		yield(get_tree().create_timer(0.5), "timeout")
		$AudioStreamPlayer2D.play()
		
