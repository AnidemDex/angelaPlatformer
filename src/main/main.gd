extends Node2D

export(String, FILE) var main_menu

var current_scene

onready var transition = $Transitions

func _ready():
	OS.window_fullscreen = Settings.fullscreen
	go_to_main_menu()
	pass


func go_to_main_menu():
	var menu = load(main_menu)
	replace_main_scene(menu)


func replace_main_scene(resource:Resource):
	if current_scene:
		current_scene.visible = false

	transition.fade_in()
	yield(transition, "animation_finished")

	call_deferred("change_scene", resource)
	
	transition.fade_out()
	yield(transition, "animation_finished")
	
	current_scene.visible = true


func change_scene(resource : Resource):

	if current_scene:
		remove_child(current_scene)
		current_scene.queue_free()

	current_scene = resource.instance()
	current_scene.visible = false
	current_scene.connect("quit", self, "go_to_main_menu")
	current_scene.connect("replace_main_scene", self, "replace_main_scene")

	add_child(current_scene)
