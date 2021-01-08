extends RigidBody2D

export(float, 0.001, 1) var time_before_fall = 0.001
export(int)var respawn_time = 5

var initial_position:Vector2 = Vector2.ZERO

onready var PlayerDetector:CollisionShape2D = $playerDetector

func _physics_process(_delta):
	if $RayCast2D.is_colliding():
		$RayCast2D.enabled = false
		_fall()
	if $RayCast2D2.is_colliding():
		$RayCast2D2.enabled = false
		_fall2()
	if $RayCast2D3.is_colliding():
		$RayCast2D3.enabled = false
		_fall3()

func _fall():
	($RayCast2D.get_collider() as PlayableBody2D).movement_speed -= 25
	
	yield(get_tree().create_timer(time_before_fall), "timeout")
	mode = MODE_CHARACTER
	yield(get_tree().create_timer(respawn_time), "timeout")
	($RayCast2D.get_collider() as PlayableBody2D).movement_speed += 25

func _fall2():
	($RayCast2D2.get_collider() as PlayableBody2D).movement_speed -= 25
	
	yield(get_tree().create_timer(time_before_fall), "timeout")
	mode = MODE_CHARACTER
	yield(get_tree().create_timer(respawn_time), "timeout")
	($RayCast2D2.get_collider() as PlayableBody2D).movement_speed += 25

func _fall3():
	($RayCast2D3.get_collider() as PlayableBody2D).movement_speed -= 25
	
	yield(get_tree().create_timer(time_before_fall), "timeout")
	mode = MODE_CHARACTER
	yield(get_tree().create_timer(respawn_time), "timeout")
	($RayCast2D3.get_collider() as PlayableBody2D).movement_speed += 25

func _on_VisibilityNotifier2D_screen_exited():
	yield(get_tree().create_timer(respawn_time), "timeout")
	mode = MODE_STATIC
	position = initial_position
	$RayCast2D.enabled = true
	$RayCast2D2.enabled = true
	$RayCast2D3.enabled = true
