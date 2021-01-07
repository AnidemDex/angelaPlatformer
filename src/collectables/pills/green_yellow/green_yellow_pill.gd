extends Area2D

onready var hurtbox:CollisionShape2D = $CollisionShape2D
export(int) var temp_movement_speed = 0
export(int) var time = 5
export(Color) var color = Color.green

func _on_green_yellow_pill_body_entered(body):
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
	body.movement_speed += temp_movement_speed
	yield(get_tree().create_timer(time), "timeout")
	body.movement_speed -= temp_movement_speed 
	visible = true
	hurtbox.set_deferred("disabled", false)
