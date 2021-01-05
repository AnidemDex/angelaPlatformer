extends CollisionShape2D

func _on_Area2D_area_entered(area):
	get_tree().change_scene("res://src/levels/test_scene/test_scene.tscn")
