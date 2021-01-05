extends Area2D

onready var hurtbox:CollisionShape2D = $CollisionShape2D
export(int) var temp_jump_force = 0

func _on_green_yellow_pill_body_entered(body):
	body.movement_speed = temp_jump_force
	visible = false
	hurtbox.set_deferred("disabled", true)
	yield(get_tree().create_timer(10), "timeout")
	body.movement_speed = 150
	visible = true
	hurtbox.set_deferred("disabled", false)
