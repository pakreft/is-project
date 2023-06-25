extends Control

func _ready():
	MusicController.play_menu_music()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://_debug/LevelOne.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://_debug/OptionsMenu.tscn")
