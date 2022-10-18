extends Area2D

onready var player_node = get_node("res://Scenes/WorldPlayer.tscn")

signal entered_hideyhole


func _ready() -> void:
#	$player_node/Camera2d.zoom_in_or_out("IN", 200, 0.1)
	pass
