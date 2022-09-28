extends Node2D


#
func _ready() -> void:
	add_child(Global.get_player())
	$"../Player/FadeOut".play("fadeout", true)
