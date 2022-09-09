extends Node2D

onready var BGMusic = $BGMusic
onready var BGplaying = true
#onready var dev_test_mode = false

func _ready() -> void:
	BGMusic.play()
