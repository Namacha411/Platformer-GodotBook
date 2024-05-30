extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_body_entered(body):
	if body.name == "Character":
		UI.add_coin(1)
		Audio.get_node("Coin").play()
		self.queue_free()
