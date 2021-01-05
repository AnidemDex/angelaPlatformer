extends Area2D


func _on_MoneyBag_body_entered(body):
	body.stats.sanity -= 1
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	queue_free()
