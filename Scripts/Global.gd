extends Node2D

onready var BGplaying = true
onready var test_mode = false
var user_OS = OS.get_name()

var music_tracks_list = ["res://Assets/Music/orc.ogg", "res://Assets/Music/Aggressor2-mq.ogg", "res://Assets/Music/KneeDeepintheDead.ogg", "res://Assets/Music/LawAbidingCitizen.ogg", "res://Assets/Music/LANDER_DUB3.ogg"]

var music_playing_order = [4,3,2,1,0]

var current_music_track = 1

var now_playing = music_tracks_list[music_playing_order[current_music_track]]

func _ready() -> void:
	play_next_track()

func _on_BGMusic_finished() -> void:
	# pause a few seconds between tracks
	yield(get_tree().create_timer(3), "timeout")
	now_playing = music_tracks_list[music_playing_order[current_music_track]]
	current_music_track += 1
	if current_music_track > music_tracks_list.size():
		current_music_track = 0
	play_next_track()
		
func play_next_track():
	$BGMusic.stream = load(now_playing)
	$BGMusic.play()
	current_music_track += 1
	
func toggle_music_in_pause_screen():
	if $BGMusic.playing:
		$BGMusic.stop()
	else:
		$BGMusic.play()			
	BGplaying = !BGplaying
