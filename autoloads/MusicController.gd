extends Node

var menu_theme = load("res://sounds/menuTheme.wav")
var level_theme = load("res://sounds/levelTheme.wav")

var menu_music_playing = false
var sound_muted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_menu_music():
	if menu_music_playing == false && !sound_muted:
		$Music.stream = menu_theme
		$Music.play()
		menu_music_playing = true

func play_level_music():
	menu_music_playing = false
	$Music.stream = level_theme
	$Music.play()

	

