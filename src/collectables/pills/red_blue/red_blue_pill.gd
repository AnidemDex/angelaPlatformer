extends Area2D

onready var hurtbox:CollisionShape2D = $CollisionShape2D
export(int) var temp_jump_force = 0

func _on_Pill_RedBlue_body_entered(body):
	body.jump_force = temp_jump_force
	visible = false
	hurtbox.set_deferred("disabled", true)
	yield(get_tree().create_timer(10), "timeout")
	body.jump_force = 200
	visible = true
	hurtbox.set_deferred("disabled", false)
