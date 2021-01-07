extends Area2D

export(int) var sanity_damage = 1

onready var collision = $CollisionShape2D

func _on_MoneyBag_body_entered(body):
	body.stats.sanity -= 0
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	visible = false
	collision.set_deferred("disabled", true)
