extends Position2D
const player_scene = preload("res://src/player/angela.tscn")

var player_node

func _ready() -> void:
	player_node = player_scene.instance()
	player_node.global_position = global_position
	player_node.connect("ready", self, "_on_angela_ready")
	player_node.connect("request_text", owner, "_on_request_text")
	if owner:
		owner.call_deferred("add_child", player_node)
	else:
		call_deferred("add_child", player_node)

func _on_angela_ready():
	for child in get_children():
		if child is Camera2D:
			(player_node.camera as Camera2D).limit_left = child.limit_left
			(player_node.camera as Camera2D).limit_right = child.limit_right
			(player_node.camera as Camera2D).limit_top = child.limit_top
			(player_node.camera as Camera2D).limit_bottom = child.limit_bottom
