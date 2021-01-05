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


func go_to_level(level:String):
	var scene = load(level)
	replace_main_scene(scene)


func replace_main_scene(resource:Resource, transition_type:int = 0):
	print_debug("Replace main scene")
	
	make_transition_in(transition_type)
	yield(transition, "animation_finished")
	
	if current_scene:
		current_scene.visible = false

	call_deferred("change_scene", resource)


func make_transition_in(transition_type:int):
	match transition_type:
		Transition.TransitionAnim.FADE_IN:
			transition.fade_in()


func make_transition_out():
	match transition.used_transition:
		Transition.TransitionAnim.FADE_IN:
			transition.fade_out()


func change_scene(resource : Resource):

	if current_scene:
		remove_child(current_scene)
		current_scene.queue_free()

	current_scene = resource.instance()
	current_scene.visible = false
	
	current_scene.connect("ready", self, "_on_scene_ready")
	current_scene.connect("quit", self, "go_to_main_menu")
	current_scene.connect("replace_main_scene", self, "go_to_level")
	
	add_child(current_scene)

func _on_scene_ready():
	current_scene.visible = true
	make_transition_out()
