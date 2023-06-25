extends Control


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://_debug/MainMenu.tscn")


func _on_stage_one_pressed():
	get_tree().change_scene_to_file("res://_debug/LevelOne.tscn")


func _on_stage_two_pressed():
	get_tree().change_scene_to_file("res://_debug/LevelTwo.tscn")


func _on_stage_three_pressed():
	pass # Replace with function body.
