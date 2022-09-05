extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


func _on_Timer_timeout():
	self.modulate = Color(255, 0, 0)
	$Timer2.start()


func _on_Timer2_timeout():
	self.modulate = Color(255, 191, 0)
	$Timer.start()
