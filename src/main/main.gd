extends Node2D

func _ready():
	go_to_main_menu()
	pass


func go_to_main_menu():
	var menu = load("res://src/UI/main_menu/main_menu.tscn")
	change_scene(menu)


func replace_main_scene(resource):
	call_deferred("change_scene", resource)


func change_scene(resource : Resource):
	var node = resource.instance()

	for child in get_children():
		remove_child(child)
		child.queue_free()
	add_child(node)

	node.connect("quit", self, "go_to_main_menu")
	node.connect("replace_main_scene", self, "replace_main_scene")
