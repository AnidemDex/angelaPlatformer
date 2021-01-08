extends CollisionShape2D


func _on_Area2D4_body_entered(body):
	if body.movement_speed != 150:
		body.movement_speed = 150
