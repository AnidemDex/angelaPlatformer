extends Control

signal quit
signal replace_main_scene(with)


func _on_PlayButton_pressed():
	emit_signal("replace_main_scene","res://src/house/house.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	pass # Replace with function body.
