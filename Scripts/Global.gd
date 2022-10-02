extends Node2D

onready var BGMusic1 = $BGMusic
onready var BGMusic2 = $BGMusic2
onready var BGMusic3 = $BGMusic3
onready var BGMusic4 = $BGMusic4
onready var BGMusic5 = $BGMusic5
onready var BGplaying = true

onready var test_mode = false

var user_OS = OS.get_name()

#var music_tracks_list = ["BGMusic1", "BGMusic2", "BGMusic3", "BGMusic4", "BGMusic5"]
#var music_playing_order = [4,3,2,1,5]
#var current_music_track = 0

#func _ready() -> void:
#	BGMusic1.play()

func _ready():
	BGMusic1.play()

#func change_music():
#	print(music_tracks_list[current_music_track])
#	current_music_track += 1
#	if current_music_track == current_music_track - 1:
#		current_music_track = 0

func _on_BGMusic_finished():
	BGMusic2.play()

func _on_BGMusic2_finished() -> void:
	BGMusic3.play()

func _on_BGMusic3_finished() -> void:
	BGMusic4.play()

func _on_BGMusic4_finished() -> void:
	BGMusic5.play()

func _on_BGMusic5_finished() -> void:
	BGMusic1.play()
