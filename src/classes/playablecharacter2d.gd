extends KinematicBody2D
class_name PlayableBody2D

const FLOOR_NORMAL: = Vector2.UP

var direction:Vector2

var default_gravity:float
var default_movement_speed:float
var default_friction:float
var default_acceleration:float
var default_jump_force:float
var jumps:int

var _velocity:Vector2 = Vector2.ZERO
var _speed:Vector2

export(float) var gravity = 500
export(float) var movement_speed = 150
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
export(float) var jump_force = 200
export(int)var max_jumps:int = 0

export(String) var left_action = "ui_left"
export(String) var right_action = "ui_right"
export(String) var jump_action = "ui_up"

func _ready():
	gravity = abs(gravity)
	_assign_default_values()


func _process(_delta):
	_speed = Vector2(movement_speed, -jump_force)


func _physics_process(_delta):
	var is_jump_interrupted = Input.is_action_just_released("jump") and _velocity.y < 0.0
	direction = _get_direction()
	_velocity = _calculate_move_velocity(_velocity,direction,_speed,is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	if is_on_floor():
		jumps = max_jumps


func restore_default_values() -> void:
	gravity = default_gravity
	movement_speed = default_movement_speed
	friction = default_friction
	acceleration = default_acceleration
	jump_force = default_jump_force


func _get_direction() -> Vector2:
	var x_axis = Input.get_action_strength(right_action)-Input.get_action_strength(left_action)
	var y_axis = 1.0 if Input.is_action_just_pressed(jump_action) else 0.0
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
		if is_on_floor():
			out.y = (speed.y) * direction.y
		elif jumps > 0:
			out.y = (speed.y) * direction.y
			jumps -= 1
	if is_jump_interrupted:
		out.y = out.y/2
	
	out.y += gravity*get_physics_process_delta_time()
	return out


func _assign_default_values() -> void:
	default_gravity = gravity
	default_movement_speed = movement_speed
	default_friction = friction
	default_acceleration = acceleration
	default_jump_force = jump_force
