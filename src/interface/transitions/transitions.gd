extends Node

signal animation_finished(anim_name)

onready var animation = $AnimationPlayer

func fade_in():
	animation.play("fade_in")

func fade_out():
	animation.play("fade_out")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("animation_finished", anim_name)
