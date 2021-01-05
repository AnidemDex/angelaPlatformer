extends Node

var fullscreen = false

func _ready():
	load_settings()


func load_settings():
	var f = File.new()
	var error = f.open("user://settings.json", File.READ)
	if error:
		print("There are no settings to load.")
		return
	
	var d = parse_json(f.get_as_text())
	if typeof(d) != TYPE_DICTIONARY:
		return
	
	if "fullscreen" in d:
		fullscreen = bool(d.fullscreen)


func save_settings():
	var f = File.new()
	var error = f.open("user://settings.json", File.WRITE)
	assert(not error)

	var d = {
		"fullscreen":fullscreen,
		}
	f.store_line(to_json(d))
