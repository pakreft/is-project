extends Node

var jump = load("res://sounds/Quake Jump Sound Effect.mp3")
var pitch = 1.7

func _ready():
	$Sounds.stream = jump

func make_jump_sound():
	
	if(pitch == 1.7):
		$Sounds.play()
		$Sounds.pitch_scale = 1.48
		print("1")
	if(pitch == 1.5):
		$Sounds.play()
		$Sounds.pitch_scale = 1.68
		print("2")
