extends PlayableBody2D

signal died

onready var hurtbox:Area2D = $CollisionsAreas/HurtBox
onready var hitbox:Area2D = $CollisionsAreas/HitBox
onready var stats:Node = $Stats

func die() -> void:
	# Replace with the real death
	print("Angela probably died, but i'm not going to remove it from scene")
	emit_signal("died")

func _on_Stats_no_health() -> void:
	die()


func _on_HurtBox_body_entered(body:Node)->void:
	# This can be a group or a generic class (Enemy)
	if body.is_in_group("enemies"):
		stats.health -= body.damage
