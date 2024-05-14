extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/Space.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://options_menu.tscn")

func _on_exit_pressed():
	get_tree().quit()

func _process(_delta):
	if $menumusic.playing == false:
		$menumusic.play()
	pass
