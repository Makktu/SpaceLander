extends Camera2D

var zoom_start = 1
var new_zoom = 0.001

func _on_ZoomCameraDetection_body_entered(body):
	# zooms in at Bottleneck1 (at start)
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.02), "timeout")


func _on_ZoomCameraDetection_body_exited(body):
	# zooms in at Bottleneck2 (near the end)
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.02), "timeout")
		zoom = Vector2(1,1)


func _on_ZoomCameraDetection3_body_entered(body: Node) -> void:
	# Zooms OUT at the approach to the portal (at end)
		if body.name == "Player":
			for n in 650: 			
				zoom = Vector2(zoom_start,zoom_start)
				zoom_start += new_zoom
				yield(get_tree().create_timer(0.02), "timeout")
