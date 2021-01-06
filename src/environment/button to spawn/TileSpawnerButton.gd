extends RigidBody2D


onready var HurtBox = $HurtBox

func _ready():
	visible = false

	


func _on_Area2D_body_entered(body):
	visible = true
	HurtBox.set_deferred("disabled", false)



func _on_Area2D3_body_entered(body):
	visible = true
	HurtBox.set_deferred("disabled", false)
