extends Area2D

export(Color) var color:Color = Color.gray

onready var hurtbox:CollisionShape2D = $CollisionShape2D

func _on_body_entered(body):
	if (body as PlayableBody2D).max_jumps != 1:
		(body as PlayableBody2D).max_jumps = 1
		body.modulate = color
	visible = false
	hurtbox.set_deferred("disabled", true)
