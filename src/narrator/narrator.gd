extends Control

<<<<<<< Updated upstream
export(int) var duration:int = 4

onready var text_label:Label = $PopupPanel/MarginContainer/Label
onready var popup:PopupPanel = $PopupPanel
onready var timer:Timer = $Timer

func _ready():
	# FIXME: delete this _ready method
	set_text_n_show("Everything is dark...")

func set_text_n_show(text:String) -> void:
	# TODO: Esto deberia mostrarse con una animación
	text_label.text = text
	popup.popup()
	
func _on_fox_talking(text):
	set_text_n_show(text)
	
func _on_PopupPanel_about_to_show():
	timer.wait_time = duration
	timer.start()


func _on_Timer_timeout():
	popup.hide()
=======
>>>>>>> Stashed changes
