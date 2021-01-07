extends PlayableBody2D

signal died
signal request_text(text)

onready var hurtbox:Area2D = $CollisionsAreas/HurtBox
onready var stats:Node = $HealthNode
onready var timer:Timer = $DeathTimer
onready var camera:Camera2D = $Camera2D

func hpDie() -> void:
	# Replace with the real death
	print("Angela probably died, but i'm not going to remove it from scene")
	emit_signal("died")
	emit_signal("request_text", "Now Angela is dead")

func sntyDie() -> void:
	# Replace with the real death
#	print("Angela probably died, but i'm not going to remove it from scene")
	emit_signal("died")
	emit_signal("request_text", "Angela has had a mental breakdown and is no longer able to continue her search. Her mom passes away, and she is sent to an asylum for the trauma dealt and for saying she spoke with talking animal people and that she thought she was a bunny.")
	queue_free()

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
		match stats.sanity:
			stats.max_sanity:
				msg = "Angela needs to find money, but there isnt any"
			5:
				msg = "the bag was empty"
			4:
				msg = "Empty again, Angela starts struggling to think straight"
			3:
				msg = "...Empty. Angela is really struggling to think straight"
			2:
				msg = "ofcourse its empty"
			1:
				msg = "nothing, at all. The harshness of reality is starting to set in, angela is horrified that her mom may pass. "
			_:
				msg = "Angela has a mental breakdown. she was so close, she failed. her mom never recovered"
		if msg:
			emit_signal("request_text", msg)


func _on_Timer_timeout():
	stats.health -= 0
