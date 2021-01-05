extends RigidBody2D

export(float, 0.001, 1) var time_before_fall = 0.001

onready var PlayerDetector:CollisionShape2D = $playerDetector

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		$RayCast2D.enabled = false
		_fall()
	


func _fall():
	($RayCast2D.get_collider() as PlayableBody2D).movement_speed -= 25
	yield(get_tree().create_timer(time_before_fall), "timeout")
	mode = MODE_CHARACTER
