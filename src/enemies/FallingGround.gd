extends RigidBody2D

onready var PlayerDetector:CollisionShape2D = $playerDetector
onready var FallDetector:CollisionShape2D = $FallDetector

func _ready():
	set_mode(1)

func _on_Area2D_body_entered(body):
	yield(get_tree().create_timer(0.05), "timeout")
	visible = false
	PlayerDetector.set_deferred("disabled", true)
#	FallDetector.set_deferred("disabled", false)
	yield(get_tree().create_timer(6), "timeout")
	visible = true
	PlayerDetector.set_deferred("disabled", false)
#	FallDetector.set_deferred("disabled", true)
