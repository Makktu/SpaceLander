extends Node2D


func _on_PortalZoom_body_entered(body):
	if body.name == "Player":
		$CanvasModulate.visible = false


func _on_PortalZoom_body_exited(body):
	if body.name == "Player":
		$CanvasModulate.visible = true
		$CanvasModulate.color = "red"
