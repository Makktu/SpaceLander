extends Node2D

onready var BGMusic = $BGMusic
onready var BGplaying = true
onready var test_mode = false

var user_OS = OS.get_name()



func _ready() -> void:
	BGMusic.play()
	print(user_OS)
