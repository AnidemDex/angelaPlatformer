extends RigidBody2D

var initial_position:Vector2 = Vector2.ZERO

func _on_Area2D_body_entered(body):
	print("okay, step 1")
	if body.state == 2:
		print("okay, step 2")
		body.state = 0
		print("okay, step 3")

func _on_Area2D_body_exited(body):
	print("okay, step 5")
	if body.state == 0:
		print("okay, step 5")
		body.state = 2
		print("okay, step 6")
