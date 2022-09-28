extends Node2D


func _on_PortalZoom_body_entered(body):
#	if body.name == "Player":
#		$CanvasModulate.visible = false
	pass
	
func transfer_player():
	remove_child($Player)
	Global.store_player($Player)
	get_tree().change_scene("res://Scenes/TesterOnly.tscn")
