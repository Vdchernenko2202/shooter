extends Control


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _process(delta):
	if $optionsmenumusic.playing == false:
		$optionsmenumusic.play()
	pass
