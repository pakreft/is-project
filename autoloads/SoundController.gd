extends Node

var jump = load("res://sounds/Quake Jump Sound Effect.mp3")
var game_over = load("res://sounds/game-over-arcade-6435.mp3")
var pitch = 1.7

func _ready():
	$Sounds.stream = jump

func make_jump_sound():
	$Sounds.stream = jump
	$Sounds.volume_db = -25
	$Sounds.pitch_scale = 1.7
	$Sounds.play()
	

func play_game_over_sound():
	$Sounds.stream = game_over
	$Sounds.volume_db = 5
	$Sounds.pitch_scale = 1
	$Sounds.play()
