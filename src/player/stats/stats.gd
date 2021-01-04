extends Node

export(int) var max_health = 6 setget set_max_health
export(int) var max_sanity = 6 setget set_max_sanity
var health = max_health setget set_health
var sanity = max_sanity setget set_sanity

signal no_health
signal health_changed(value)
signal max_health_changed(value)
signal no_sanity
signal sanity_changed(value)
signal max_sanity_changed(value)

func set_max_health(value):
	max_health = value
	self.health = clamp(health, 0, max_health)
	emit_signal("max_health_changed", max_health)

func set_max_sanity(value):
	max_sanity = value
	self.sanity = clamp(sanity, 0, max_sanity)
	emit_signal("max_sanity_changed", max_sanity)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if value <= 0:
		emit_signal("no_health")

func set_sanity(value):
	sanity = value
	emit_signal("sanity_changed", sanity)
	if value <= 0:
		emit_signal("no_sanity")

func _ready():
	self.health = max_health
	self.sanity = max_sanity

func _on_Stats_sanity_changed(value):
	print(sanity)
