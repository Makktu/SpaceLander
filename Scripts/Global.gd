extends Node2D

onready var BGMusic = $BGMusic
onready var BGplaying = true

func _ready() -> void:
	BGMusic.play()
	pass
