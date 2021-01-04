extends Area2D



func _on_MoneyBag_body_entered(body):
	queue_free()
