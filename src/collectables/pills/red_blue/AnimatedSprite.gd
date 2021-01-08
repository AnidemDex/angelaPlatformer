extends AnimatedSprite


func _ready():
	hide()

func _on_AnimatedSprite_animation_finished():
	_set_playing(false)
	hide()

func _on_Pill_RedBlue_respawn():
	show()
	_set_playing(true)
