extends Sprite2D

var is_goal: bool = false
var coin = preload("res://coin.tscn")

func _on_area_body_entered(body):
	if body.name == "Character" and !is_goal:
		self.frame = 1
		is_goal = true
		for i in range(200):
			var new = coin.instantiate()
			new.falldown = true
			new.position = Vector2(randf_range(-100.0, 100.0), -500)
			await get_tree().create_timer(0.01).timeout
			self.add_child(new)
		await get_tree().create_timer(3).timeout
		UI.restart()
		# get_tree().change_scene_to_file("res://stage1.tscn")
