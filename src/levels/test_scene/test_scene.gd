extends Node2D

signal quit
signal replace_main_scene(with)

onready var narrator = $CanvasLayer/Narrator

func _ready():
	connect("replace_main_scene", self, "dev")

func _on_Angela_request_text(text):
	narrator.set_text_n_show(text)

func dev(a):
	print(a)
