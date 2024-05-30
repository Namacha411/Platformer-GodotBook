extends CanvasLayer

var coin = 0
@onready var label = $Label

var hp = 100
@onready var health = $Health

func add_coin(value):
	coin += value
	label.text = "%02d" % coin

func damage(value):
	Audio.get_node("Damage").play()
	hp -= value
	health.value = hp

func heal(value):
	Audio.get_node("Heal").play()
	hp += value
	health.value = hp
	
