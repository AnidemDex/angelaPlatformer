extends AnimatedSprite


func _ready():
	hide()
	
func _on_Pill_RedBlue_body_entered(_body):
	show()
	_set_playing(true)
	yield(get_tree().create_timer(0.8), "timeout")
	_set_playing(false)
	hide()
