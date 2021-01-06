extends Area2D

export(int) var sanity_damage = 1

func _on_MoneyBag_body_entered(body):
	body.stats.sanity -= sanity_damage
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	visible = false
	set_deferred("disabled", true)
