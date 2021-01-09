extends Control


onready var popup = $PopupDialog
onready var popup2 = $PopupDialog2

var time = 5

func _ready():
	popup.popup_centered()
	yield(get_tree().create_timer(time), "timeout")
	popup.hide()

func _physics_process(delta):
	if Input.is_action_just_pressed("remove_text"):
		popup.hide()
		popup2.hide()

func _on_MoneyBag_body_entered(body):
	popup2.popup_centered()
	yield(get_tree().create_timer(time), "timeout")
	popup2.hide()
