extends Control




func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://_debug/test_level.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://_debug/OptionsMenu.tscn")
