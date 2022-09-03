extends Node2D

var laser_playing = false

func _on_Timer_timeout() -> void:
	if laser_playing:
		$AnimatedSprite.visible = false
		$LaserCollider.disabled = true
		$laser_sound.stop()
		$AnimatedSprite.visible = false
		laser_playing = false
	else:
		$AnimatedSprite.visible = true
		$LaserCollider.disabled = false
		$AnimatedSprite.play()
		$laser_sound.play()
		laser_playing = true

