tool
class_name Transition
extends Node

signal animation_finished(anim_name)

enum TransitionAnim {
	FADE_IN,
	FADE_OUT,
}

var used_transition

onready var animation = $AnimationPlayer

func fade_in():
	used_transition = TransitionAnim.FADE_IN
	animation.play("fade_in")

func fade_out():
	used_transition = TransitionAnim.FADE_OUT
	animation.play("fade_out")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("animation_finished", anim_name)
