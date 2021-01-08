extends RigidBody2D


export(float, 0.001, 1) var time_before_fall = 0.001
export(int)var respawn_time = 5

var initial_position:Vector2 = Vector2.ZERO

onready var Ray_Casting:CollisionShape2D = $Area2D/CollisionShape2D
onready var PlayerDetector:CollisionShape2D = $playerDetector

func _on_VisibilityNotifier2D_screen_exited():
	yield(get_tree().create_timer(respawn_time), "timeout")
	mode = MODE_STATIC
	position = initial_position
	Ray_Casting.set_deferred("disabled", false)
	PlayerDetector.set_deferred("disabled", false)

func _on_Area2D_body_entered(body):
	PlayerDetector.set_deferred("disabled", true)
	Ray_Casting.set_deferred("disabled", true)
	if body.movement_speed <= 150:
		body.movement_speed -= 25
		yield(get_tree().create_timer(time_before_fall), "timeout")
		Ray_Casting.set_deferred("disabled", true)
		mode = MODE_CHARACTER
		yield(get_tree().create_timer(respawn_time), "timeout")
		body.movement_speed += 25
	else:
		yield(get_tree().create_timer(time_before_fall), "timeout")
		Ray_Casting.set_deferred("disabled", true)
		mode = MODE_CHARACTER
		yield(get_tree().create_timer(respawn_time), "timeout")
