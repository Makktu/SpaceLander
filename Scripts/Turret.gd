extends Area2D

onready var world_node = get_node("/root/World/Player")

func _on_Turret_body_entered(body: Node) -> void:
	if body.name == "Player":
		if !$"/root/Global".test_mode:
			world_node.game_over()
