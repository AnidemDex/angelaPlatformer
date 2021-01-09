extends Control

export(int) var duration:int = 4

onready var popup = $PopupDialog2
onready var popup2 = $PopupDialog

var time = 5

func _ready():
	popup.popup_centered()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("remove_text"):
		popup.hide()
		popup2.hide()

func _on_MoneyBag_body_entered(_body):
	print("testing the bag")
	popup2.popup_centered()
	yield(get_tree().create_timer(time), "timeout")
	popup2.hide()

