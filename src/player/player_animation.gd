extends AnimatedSprite

var last_direction

func _ready():
	play("idle")

func _process(_delta):
	var dir:int = (owner as PlayableBody2D).direction.x
	match dir:
		-1:
			flip_h = true
			offset.x = 12
		1:
			flip_h = false
			offset.x = 0
	
	if dir:
		play("walking")
	else:
		play("idle")
