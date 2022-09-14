extends Node2D

onready var BGMusic = $BGMusic
onready var BGplaying = true
onready var test_mode = false
#onready var camera = $"/root/World/Player/Camera2D"

var player_starting_map_position = Vector2(648, -823)

var user_OS = OS.get_name()



func _ready() -> void:
	BGMusic.play()
	print(user_OS)
