extends AnimatedSprite

var last_direction

func _ready():
	play("idle")

func _process(_delta):
	var dir:int = (owner as PlayableBody2D).direction.x
	match dir:
		-1:
			flip_h = true
		1:
			flip_h = false
	
	if dir:
		play("walking")
	else:
		play("idle")
