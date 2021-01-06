extends Area2D

export(Color) var color:Color = Color.gray

onready var hurtbox:CollisionShape2D = $CollisionShape2D

func _on_body_entered(body):
	(body as PlayableBody2D).max_jumps = 1
	body.modulate = color
	queue_free()
