extends Camera2D

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		if zoom == Vector2(1, 1):
			zoom = Vector2(0.5, 0.5)
			print("test2")
		else:
			zoom = Vector2(1, 1)
			print("test3")
