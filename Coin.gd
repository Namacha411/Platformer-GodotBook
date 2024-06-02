extends Sprite2D

var falldown: bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed_y: float = 0.0


func _process(delta):
	if falldown:
		speed_y += gravity * delta
		position.y += speed_y * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_body_entered(body):
	if body.name == "Character":
		UI.add_coin(1)
		Audio.get_node("Coin").play()
		self.queue_free()
