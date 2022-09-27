extends Camera2D

var zoom_start = 1
var new_zoom = 0.001

var passed_through_middle_1 = false
var passed_through_middle_2 = false

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
			yield(get_tree().create_timer(0.03), "timeout")


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
		for n in 100: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.10), "timeout")
#		zoom = Vector2(1,1)


func _on_PortalZoom_body_entered(body: Node) -> void:
	# Zooms OUT at the approach to the portal (at end)
	if body.name == "Player":
		for n in 1450: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.002), "timeout")


func _on_PortalZoom_body_exited(body: Node) -> void:
	if body.name == "Player":
		for n in 1650: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.1), "timeout")


func _on_ZoomOut_body_entered(body):
	if body.name == "Player":
		for n in 1450: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.002), "timeout")


func _on_ZoomOutMiddle_body_entered(body: Node) -> void:
	if body.name == "Player" and passed_through_middle_1 == false:
		for n in 400: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.002), "timeout")
		passed_through_middle_1 = true


func _on_ZoomBackInMiddle2_body_entered(body: Node) -> void:	
	if body.name == "Player" and passed_through_middle_2 == false:
		for n in 500: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start -= new_zoom
			yield(get_tree().create_timer(0.01), "timeout")
		passed_through_middle_2 = true


func _on_ZoomOutCanyon_body_entered(body: Node) -> void:
	if body.name == "Player":
		for n in 300: 			
			zoom = Vector2(zoom_start,zoom_start)
			zoom_start += new_zoom
			yield(get_tree().create_timer(0.001), "timeout")
