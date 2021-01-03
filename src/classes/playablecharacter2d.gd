extends KinematicBody2D
class_name PlayableBody2D

const FLOOR_NORMAL: = Vector2.UP

var direction:Vector2
var _velocity:Vector2 = Vector2.ZERO
var _speed:Vector2

export(float) var gravity
export(float) var movement_speed
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
export(float) var jump_force

export(String) var left_action = "left_button"
export(String) var right_action = "right_button"
export(String) var jump_action = "jump_button"

func _ready():
	gravity = abs(gravity)


func _process(_delta):
	_speed = Vector2(movement_speed, -jump_force)


func _physics_process(_delta):
	var is_jump_interrupted = Input.is_action_just_released("jump") and _velocity.y < 0.0
	direction = _get_direction()
	_velocity = _calculate_move_velocity(_velocity,direction,_speed,is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func _get_direction() -> Vector2:
	var x_axis = Input.get_action_strength(right_action)-Input.get_action_strength(left_action)
	var y_axis = 1.0 if Input.is_action_just_pressed(jump_action) and is_on_floor() else 0.0
	return Vector2(x_axis, y_axis)


func _calculate_move_velocity(
	linear_velocity:Vector2,
	direction:Vector2,
	speed:Vector2,
	is_jump_interrupted:bool
	)->Vector2:
		
	var out:Vector2 = linear_velocity
	
	if direction.x != 0:
		out.x = lerp(out.x, direction.x*speed.x, acceleration)
	else:
		out.x = lerp(out.x, 0, friction)

	
	if direction.y:
		out.y = (speed.y) * direction.y
	if is_jump_interrupted:
		out.y = out.y/2
	
	out.y += gravity*get_physics_process_delta_time()
	return out
