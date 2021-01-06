extends MarginContainer

signal ConfirmSection_pressed

onready var fullscreen = $Settings/HBox/Options/FullScreen
onready var mainvol = $Settings/HBox/Options/MainVol
onready var effectvol = $Settings/HBox/Options/EffectsVol

func _draw():
	fullscreen.pressed = Settings.fullscreen


func _on_ApplyButton_pressed():
	Settings.fullscreen = fullscreen.pressed
	Settings.save_settings()
	
	OS.window_fullscreen = Settings.fullscreen
	
	emit_signal("ConfirmSection_pressed")


func _on_CancelButton_pressed():
	emit_signal("ConfirmSection_pressed")
