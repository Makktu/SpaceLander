extends Area2D

onready var world_player = get_node("/root/World/Player")
var just_picked_up = false

func _on_FuelPickup_body_entered(_body: Node) -> void:
	if just_picked_up == true:
		return
	just_picked_up = true	
	$AnimationPlayer.play("pulsate")
	$AudioStreamPlayer2D.play()
	yield($AudioStreamPlayer2D, "finished")
	world_player.update_GUI()
	queue_free()
	just_picked_up = false
	
func _ready() -> void:
	$AnimationPlayer.play("RESET")
	
