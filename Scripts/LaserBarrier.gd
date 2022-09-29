extends Node2D

onready var player_node = get_node("/root/World/Player")
var laser_playing = false

func _on_Timer_timeout() -> void:
	if !laser_playing:
		$AnimatedSprite.visible = true
		$LaserCollider.disabled = false
		$AnimatedSprite.play()
		$laser_sound.play()
		laser_playing = true		
	else:
		$AnimatedSprite.visible = false
		$LaserCollider.disabled = true
		$laser_sound.stop()
		$AnimatedSprite.visible = false
		laser_playing = false
		

func _on_LaserBarrier_body_entered(body: Node) -> void:
	if body.name == "Player":
		if !$"/root/Global".test_mode:
			player_node.game_over()
