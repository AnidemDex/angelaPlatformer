extends TileMap

export(String, FILE, "*.tscn") var source:String
export(Vector2) var offset:Vector2 = Vector2(16,16)

var _node:PackedScene

func _ready():
	_node = load(source)
	_generate()
	

func _generate():
	for cell_position in get_used_cells():
		var generated_node = _node.instance()
		add_child(generated_node)
		generated_node.position = map_to_world(cell_position)+Vector2(16,16)
		set_cellv(cell_position, -1)
