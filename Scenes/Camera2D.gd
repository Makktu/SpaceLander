extends Camera2D


func _ready():
	pass


#func _on_ZoomCameraDetection_body_entered(body):
#	print (body.name)
#	if body.name == "Player":
#		zoom.x -= 2
#		zoom.y -= 2



func _on_ZoomCameraDetection_area_entered(area):
#	print (body.name)
#	if body.name == "Player":
	zoom.x -= 2
	zoom.y -= 2
