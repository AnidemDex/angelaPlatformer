extends PlayableBody2D

signal died
signal request_text(text)

onready var hurtbox:Area2D = $CollisionsAreas/HurtBox
onready var stats:Node = $Stats
onready var timer:Timer = $Timer

func hpDie() -> void:
	# Replace with the real death
	print("Angela probably died, but i'm not going to remove it from scene")
	emit_signal("died")
	emit_signal("request_text", "Now Angela is dead")

func sntyDie() -> void:
	# Replace with the real death
	print("Angela probably died, but i'm not going to remove it from scene")
	emit_signal("died")
	emit_signal("request_text", "Now Angela is dead")

func _on_Stats_no_health() -> void:
	hpDie()

func _on_Stats_no_sanity():
	sntyDie()

func _on_HurtBox_body_entered(body:Node)->void:
	# This can be a group or a generic class (Enemy)
	if body.is_in_group("enemies"):
		stats.sanity -= body.damage
		
	
	var msg = ""
	if stats:
		match stats.health:
			stats.max_health:
				msg = "Angela needs money"
			5:
				msg = "Still no money, Angela starts struggling to think straight"
			3:
				msg = "Angela is really struggling to think straight"
			2:
				msg = "The harshness of reality is starting to set in, angela is horrified that her mom may pass. "
			1:
				msg = "Angela has a mental breakdown. she was so close, she failed. her mom never recovered"
			_:
				pass
		if msg:
			emit_signal("request_text", msg)


func _on_Timer_timeout():
	stats.health -= 1
