extends Sprite

var newDeltaX
var newDeltaY
var deltaX
var deltaY
var touchPos = Vector2()
var areaEntered = false

func _on_TouchScreenButton_pressed() -> void:
	areaEntered = true


func _on_TouchScreenButton_released() -> void:
	areaEntered = false
	
func _input(event):
	if areaEntered:
		if event is InputEventScreenTouch and event.is_pressed():
			touchPos = event.get_position()
			deltaX = touchPos.x - position.x
			deltaY = touchPos.y - position.y
			
		elif event is InputEventScreenDrag:
			touchPos = event.get_position()
			newDeltaX = touchPos.x - deltaX
			newDeltaY = touchPos.y - deltaY
			set_position(Vector2(newDeltaX, newDeltaY))	
