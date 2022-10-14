extends Node2D

onready var BGplaying = true
onready var test_mode = false
onready var current_level = 1
var user_OS = OS.get_name()

var music_tracks_list = ["res://Assets/Music/LANDER_DUB1.ogg","res://Assets/Music/lander0.ogg","res://Assets/Music/orc.ogg","res://Assets/Music/LANDER_DUB3.ogg","res://Assets/Music/lander_march.ogg", "res://Assets/Music/lander_menu.ogg", "res://Assets/Music/wonder.ogg"]

var music_track_name = ["Lander One", "Lander Zero", "Orc Lightning", "Lander III", "Lander March", "The SpaceLander", "Wonder"]

var current_music_track = 0

var now_playing = music_tracks_list[current_music_track]

func _ready() -> void:
#	pass
	play_next_track()

func blank_screen(time_blank):
	$CanvasLayer/GlobalSceneTransitionRect/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(time_blank), "timeout")
	$CanvasLayer/GlobalSceneTransitionRect/AnimationPlayer.play_backwards("fade")
	
	
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
	now_playing = music_tracks_list[current_music_track]
	$BGMusic.stream = load(now_playing)
	$BGMusic.play()
	$CanvasLayer.visible = true
	$CanvasLayer/ShowCurrentlyPlayingTrack/Label.text = " " + music_track_name[current_music_track]
	$CanvasLayer/ShowCurrentlyPlayingTrack/Label.visible = true
	$CanvasLayer/ShowCurrentlyPlayingTrack/Label/MusicNote.visible = true
	$CanvasLayer/ShowCurrentlyPlayingTrack/AnimationPlayer.play_backwards("fadetext")
	yield(get_tree().create_timer(4), "timeout")
	$CanvasLayer/ShowCurrentlyPlayingTrack/AnimationPlayer.play("fadetext")
	$CanvasLayer/ShowCurrentlyPlayingTrack/Label/MusicNote.visible = false
	current_music_track += 1
	if current_music_track > music_tracks_list.size() - 1:
		current_music_track = 0

func toggle_music_in_pause_screen():
	if $BGMusic.playing:
		$BGMusic.stop()
	else:
		$BGMusic.play()			
	BGplaying = !BGplaying
