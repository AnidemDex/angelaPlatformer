extends Control

signal quit
signal replace_main_scene(with)


func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/house/house.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
