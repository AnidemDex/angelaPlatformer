extends RigidBody2D

export(float, 0.001, 1) var time_before_fall = 0.001

onready var PlayerDetector:CollisionShape2D = $playerDetector

func _physics_process(_delta):
	if $RayCast2D.is_colliding():
		$RayCast2D.enabled = false
		_fall()
	
#func respawn():
#	yield(get_tree().create_timer(10), "timeout")
#	var falling_node = instance()
#	falling_node.global_position = global_position
#	if owner:
#		owner.call_deferred("add_child", falling_node)
#	else:
#		call_deferred("add_child", falling_node)

func _fall():
	($RayCast2D.get_collider() as PlayableBody2D).movement_speed -= 25
	yield(get_tree().create_timer(time_before_fall), "timeout")
	mode = MODE_CHARACTER
#	respawn()
