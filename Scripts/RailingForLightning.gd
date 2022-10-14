extends Area2D

onready var player_lightning_node = get_node("/root/World/Player")


func _on_RailingForLightning_body_entered(body):
	if body.name == "Player" and !$"/root/Global".test_mode:
		$"../Player".game_over()


func _on_PlayerCollisionDetector_body_entered(body: Node) -> void:
	if body.name == "Player" and !$"/root/Global".test_mode:
		player_lightning_node.game_over()
		
