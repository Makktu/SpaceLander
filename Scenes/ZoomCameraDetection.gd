extends Area2D


func _ready():
	pass


func _on_ZoomCameraDetection_body_entered(body):
	$"/root/World/Camera2D".zoom.x += 2
	$"/root/World/Camera2D".zoom.y += 2
	
