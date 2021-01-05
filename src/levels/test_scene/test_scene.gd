extends Node2D

signal quit
signal replace_main_scene(with)

onready var narrator = $CanvasLayer/Narrator

func _on_Angela2_died():
	narrator.set_text_n_show("Angela probably died")


func _on_Angela_request_text(text):
	narrator.set_text_n_show(text)


