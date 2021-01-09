extends Area2D

onready var collision = $CollisionShape2D

func _on_MoneyBag_body_entered(body):
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	visible = false
	collision.set_deferred("disabled", true)
