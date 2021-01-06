extends CanvasLayer

signal quit
signal replace_main_scene(with)

onready var tween = $Tween
onready var text = $CenterContainer/Control/VBoxContainer/Label
onready var thanks = $CenterContainer/Control/VBoxContainer/Label2

func _ready():
	tween.interpolate_property(
		text, "percent_visible", 0, 1, 15)
	tween.start()



func _on_tween_completed(object, key):
	thanks.visible = true
	yield(get_tree().create_timer(10), "timeout")
	emit_signal("quit")
	
