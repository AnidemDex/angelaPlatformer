extends Node2D

onready var narrator = $CanvasLayer/Narrator

func _on_Angela2_died():
	narrator.set_text_n_show("Angela probably died")
