extends Node2D

var musicOn = true 

func _on_Button_pressed() -> void:
	if musicOn:
		$"/root/Global/BGMusic".stop()
		musicOn = false
	else:
		$"/root/Global/BGMusic".play()
		musicOn = true
