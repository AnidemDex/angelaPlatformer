extends Control


export(int) var duration:int = 2.5

onready var popup = $PopupDialog
onready var popup2 = $PopupDialog2
onready var popup3 = $PopupDialog3
onready var popup4 = $PopupDialog4

var counter = 0
var counter2 = 0
var counter3 = 0
var counter4 = 0
var time = 10

func _ready():
	if counter3 == 0:
		popup4.popup_centered()
		yield(get_tree().create_timer(time), "timeout")
		popup4.hide()

func _physics_process(delta):
	if Input.is_action_just_pressed("remove_text"):
		popup.hide()
		popup2.hide()
		popup3.hide()
		popup4.hide()
	
func _on_Pill_RedBlue_area_entered(area):
	if counter4 == 0:
		popup.popup_centered()
		yield(get_tree().create_timer(time), "timeout")
		popup.hide()
		
func _on_Pill_DoubleJump_area_entered(area):
	if counter4 == 0:
		popup2.popup_centered()
		yield(get_tree().create_timer(time), "timeout")
		popup2.hide()

func _on_green_yellow_pill_area_entered(area):
	if counter2 == 0:
		popup3.popup_centered()
		yield(get_tree().create_timer(time), "timeout")
		popup3.hide()

func _on_PopupDialog_popup_hide():
	counter = 1

func _on_PopupDialog3_popup_hide():
	counter2 = 1

func _on_PopupDialog4_popup_hide():
	counter3 = 1

func _on_PopupDialog2_popup_hide():
	counter4 = 1
