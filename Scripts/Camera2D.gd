extends Camera2D

var zoom_start = 1
var new_zoom = 0.001

func game_over_zoom_out():
	for n in 1000: 			
		zoom = Vector2(zoom_start,zoom_start)
		zoom_start += new_zoom + 0.02
		yield(get_tree().create_timer(0.0002), "timeout")
	

func starting_camera_zoom():
	var starting_zoom = 3
	for n in 200: 			
		zoom = Vector2(starting_zoom, starting_zoom)
		starting_zoom -= 0.01
		yield(get_tree().create_timer(0.0000001), "timeout")
	zoom = Vector2(1,1)
				
#func _ready() -> void:
#	self.make_current()


func _on_3rdCameraZoom_body_entered(body: Node) -> void:
	# zooms in at Bottleneck1 (at start)
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.02), "timeout")


func _on_2ndCameraZoom_body_entered(body: Node) -> void:
	# zooms in at Bottleneck2 (near the end)
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.02), "timeout")



func _on_2ndCameraZoom_body_exited(body: Node) -> void:
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.02), "timeout")



func _on_3rdCameraZoom_body_exited(body: Node) -> void:
	if body.name == "Player":
		for n in 200: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.02), "timeout")
#		zoom = Vector2(1,1)


func _on_PortalZoom_body_entered(body: Node) -> void:
	# Zooms OUT at the approach to the portal (at end)
	if body.name == "Player":
		for n in 1650: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.002), "timeout")


func _on_PortalZoom_body_exited(body: Node) -> void:
	if body.name == "Player":
		for n in 1650: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.1), "timeout")
