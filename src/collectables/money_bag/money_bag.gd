extends Area2D

var damage = 1

func _on_MoneyBag_body_entered(body):
	queue_free()
