extends Camera2D

var zoom_start = 1
var new_zoom = 0.001

func _on_ZoomCameraDetection_body_entered(body):
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.02), "timeout")


func _on_ZoomCameraDetection_body_exited(body):
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.02), "timeout")
		zoom = Vector2(1,1)
