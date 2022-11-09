extends Node2D

onready var BGplaying = true
onready var just_starting = true
onready var test_mode = false
onready var current_level = 1
var user_OS = OS.get_name()

var music_tracks_list = ["res://Assets/Music/lander0.ogg","res://Assets/Music/landerdub1.ogg","res://Assets/Music/orc.ogg","res://Assets/Music/landerdub3.ogg","res://Assets/Music/lander_march.ogg", "res://Assets/Music/lander_menu.ogg"]

var music_track_name = ["Lander Zero", "Lander One", "Arc Lightning", "Lander III", "Lander March", "The SpaceLander", "Wonder"]

var current_music_track = 0

var now_playing = music_tracks_list[current_music_track]

func _ready() -> void:
	yield(get_tree().create_timer(2.5), "timeout")
	play_next_track()
	
func won_the_game():
	print("Welcome Home, SpaceLander...")
	yield(get_tree().create_timer(10), "timeout")
	$CanvasLayer/GlobalSceneTransitionRect/AnimationPlayer.play("fade")


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
	
		
func play_next_track(finale = false):
	if just_starting:
		yield(get_tree().create_timer(5), "timeout")
		just_starting = false
		play_next_track()
		
	if !finale:
		now_playing = music_tracks_list[current_music_track]
		$CanvasLayer/ShowCurrentlyPlayingTrack/Label.text = " " + music_track_name[current_music_track]
	if finale:
		# fade down current track
		# silence for a bit
		# then play 'Wonder'
		for n in 30:
			yield(get_tree().create_timer(0.4), "timeout")
			$BGMusic.volume_db -= 2
		$BGMusic.stop()
		$BGMusic.volume_db = -15
#		yield(get_tree().create_timer(5), "timeout")
		now_playing = "res://Assets/Music/wonder.ogg"
		$CanvasLayer/ShowCurrentlyPlayingTrack/Label.text = " Wonder"
	$BGMusic.stream = load(now_playing)
	$BGMusic.play()
	$CanvasLayer.visible = true
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
