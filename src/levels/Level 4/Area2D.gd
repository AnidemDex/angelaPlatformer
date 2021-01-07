extends Area2D

onready var collision = $CollisionShape2D

func _on_Area2D2_area_entered(area):
	visible = false
	collision.set_deferred("disabled", true)
