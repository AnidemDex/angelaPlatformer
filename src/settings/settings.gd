extends MarginContainer

signal ConfirmSection_pressed

var mainvol_new_value
var effectvol_new_value

onready var fullscreen = $HBox/Settings/HBox/Options/FullScreen
onready var mainvol = $HBox/Settings/HBox/Options/MainVol
onready var effectvol = $HBox/Settings/HBox/Options/EffectsVol


func _draw():
	fullscreen.pressed = Settings.fullscreen
	mainvol.value = remap_range(
		AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")),
		-60,0,0,100)
	effectvol.value = remap_range(
		AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")),
		-60,0,0,100)


func remap_range(value, InputA, InputB, OutputA, OutputB):
	return(value - InputA) / (InputB - InputA) * (OutputB - OutputA) + OutputA


func _on_ApplyButton_pressed():
	Settings.fullscreen = fullscreen.pressed
	Settings.save_settings()
	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), effectvol_new_value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), mainvol_new_value)
	
	OS.window_fullscreen = Settings.fullscreen
	
	emit_signal("ConfirmSection_pressed")


func _on_CancelButton_pressed():
	emit_signal("ConfirmSection_pressed")


func _on_MainVol_value_changed(value):
	mainvol_new_value = remap_range(value, mainvol.min_value, mainvol.max_value, -60, 0)


func _on_EffectsVol_value_changed(value):
	effectvol_new_value = remap_range(value, effectvol.min_value, effectvol.max_value, -60, 0)
	
