extends Area2D

onready var player_node = get_node("/root/World/Player")

func _on_Turret_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_node.game_over()
