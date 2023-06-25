extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_level_music()

func _exit_tree():
	Globals.lastLevelLoaded = "res://_debug/LevelOne.tscn"



 
