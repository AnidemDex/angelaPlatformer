extends Control

signal quit
signal replace_main_scene(with)

onready var menu = $CanvasLayer/HBoxContainer/Center/Menu
onready var settings_menu = $CanvasLayer/HBoxContainer/Center/SettingsNode

onready var play_button = menu.get_node("PlayButton")

func _ready():
	play_button.grab_focus()


func _on_PlayButton_pressed():
	emit_signal("replace_main_scene","res://src/levels/house/house.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_SettingsButton_pressed():
	menu.hide()
	settings_menu.show()
	pass # Replace with function body.


func _on_SettingsNode_ConfirmSection_pressed():
	settings_menu.hide()
	menu.show()
	play_button.grab_focus()
