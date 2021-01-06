extends Position2D
const player_scene = preload("res://src/player/angela.tscn")

func _ready() -> void:
	var player_node = player_scene.instance()
	player_node.global_position = global_position
	if owner:
		owner.call_deferred("add_child", player_node)
	else:
		call_deferred("add_child", player_node)
