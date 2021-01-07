extends Area2D

onready var hurtbox:CollisionShape2D = $CollisionShape2D
export(int) var temp_jump_force = 0
export(int) var time = 10

signal plus
signal minus

export(Color) var color = Color.cyan

func _on_Pill_RedBlue_body_entered(body):
	body.modulate = color
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(
		body,
		"modulate",
		null,
		Color.white,
		time)
	tween.start()
	visible = false
	hurtbox.set_deferred("disabled", true)
	
	body.jump_force += temp_jump_force
	yield(get_tree().create_timer(time), "timeout")
	body.jump_force -= temp_jump_force 
	visible = true
	hurtbox.set_deferred("disabled", false)
