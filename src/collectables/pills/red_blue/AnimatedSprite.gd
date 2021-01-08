extends AnimatedSprite



func _ready():
	hide()

func _on_Pill_RedBlue_body_entered(body):
	_set_playing(true)
	show()
