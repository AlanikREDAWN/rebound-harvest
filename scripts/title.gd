extends Control


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	get_tree().change_scene_to_file("res://scenes/UI/storyIntro.tscn")
