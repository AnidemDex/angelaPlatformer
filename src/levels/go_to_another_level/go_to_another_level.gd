extends Area2D

export(String, FILE) var level_path:String

func _ready():
	if not level_path:
		push_error("There's no 'level_path' in the node.")

func _on_body_entered(_body):
	if owner:
		owner.emit_signal("replace_main_scene", level_path)