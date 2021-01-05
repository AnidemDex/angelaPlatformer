extends Area2D

# The node that contains the signal to change the level
export(NodePath) var emisor_node

func _on_body_entered(_body):
	var node = get_node(emisor_node)
	node.emit_signal("replace_main_scene", node.filename)
