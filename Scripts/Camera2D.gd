extends Camera2D

var zoom_start = 1
var new_zoom = 0.001

func game_over_zoom_out():
	for n in 1000: 		
		yield(get_tree().create_timer(0.0002), "timeout")	
		zoom = Vector2(zoom_start,zoom_start)
		zoom_start += new_zoom + 0.02

		

func starting_camera_zoom():
	var starting_zoom = 3
	for n in 200: 			
		zoom = Vector2(starting_zoom, starting_zoom)
		starting_zoom -= 0.01
		yield(get_tree().create_timer(0.0000001), "timeout")
	zoom = Vector2(1,1)


func zoom_in_or_out(direction, amount, frame_delay):
	for n in amount:
		zoom = Vector2(zoom_start,zoom_start)
		if direction == "IN":
			zoom_start -= new_zoom
		if direction == "OUT":
			zoom_start += new_zoom
		yield(get_tree().create_timer(frame_delay), "timeout")
