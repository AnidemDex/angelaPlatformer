extends Node2D

var level_resource : ResourceLevelData

func _ready() -> void:
	level_resource = ResourceLoader.load("res://src/levels/levels.tres")
	go_to_test_scene()


func go_to_test_scene() -> void:
	var test_scene = ResourceLoader.load(level_resource.levels[0].source)
	change_scene(test_scene)


func change_scene(resource : Resource):
	var node = resource.instance()

	for child in get_children():
		remove_child(child)
		child.queue_free()
	add_child(node)
