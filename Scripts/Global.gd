extends Node2D

onready var BGplaying = true
onready var test_mode = false
var user_OS = OS.get_name()

var music_tracks_list = ["res://Assets/Music/orc.ogg", "res://Assets/Music/Aggressor2-mq.ogg", "res://Assets/Music/KneeDeepintheDead.ogg", "res://Assets/Music/LawAbidingCitizen.ogg", "res://Assets/Music/LANDER_DUB3.ogg","res://Assets/Music/MassExtinction.ogg","res://Assets/Music/SoulEater.ogg","res://Assets/Music/TheDevilsEyes.ogg","res://Assets/Music/Videodrome.ogg"]

var music_playing_order = [0,8,7,6,5,1,2,3,4]

var current_music_track = 0

var now_playing = music_tracks_list[music_playing_order[current_music_track]]

func _ready() -> void:
	play_next_track()
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_0:
			$BGMusic.stop()
			play_next_track()

func _on_BGMusic_finished() -> void:
	# pause a few seconds between tracks
	yield(get_tree().create_timer(5), "timeout")
	play_next_track()
	
		
func play_next_track():
	print(now_playing, current_music_track)
	now_playing = music_tracks_list[music_playing_order[current_music_track]]
	print(now_playing)
	$BGMusic.stream = load(now_playing)
	$BGMusic.play()
	current_music_track += 1
	if current_music_track > music_tracks_list.size() - 1:
		current_music_track = 0
	

func toggle_music_in_pause_screen():
	if $BGMusic.playing:
		$BGMusic.stop()
	else:
		$BGMusic.play()			
	BGplaying = !BGplaying
