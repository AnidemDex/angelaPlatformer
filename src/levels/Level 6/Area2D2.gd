extends Area2D


func _on_Area2D_body_entered(body):
	visible = true
	set_deferred("disabled", false)
