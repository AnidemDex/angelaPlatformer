extends Control


export(int) var duration:int = 2.5

onready var popup = $PopupDialog
onready var popup2 = $PopupDialog2
onready var popup3 = $PopupDialog3
onready var timer:Timer = $Timer

var time = 2

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		popup.hide()
		popup2.hide()
		popup3.hide()

func _on_Pill_DoubleJump_body_entered(body):
	popup.popup_centered()
	yield(get_tree().create_timer(time), "timeout")
	popup.hide()
	
func _on_Area2D_area_entered(area):
	popup2.popup_centered()
	yield(get_tree().create_timer(time), "timeout")
	popup2.hide()
	
func _on_Area2D2_area_entered(area):
	popup3.popup_centered()
	yield(get_tree().create_timer(time), "timeout")
	popup3.hide()
