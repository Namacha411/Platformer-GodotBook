extends CanvasLayer

var coin = 0
@onready var label = $Label

var hp = 100
@onready var health = $Health

func restart():
	coin = 0
	hp = 100
	health.value = hp
	label.text = "%02d" % coin
	get_tree().change_scene_to_file("res://stage1.tscn")

func add_coin(value):
	coin += value
	label.text = "%02d" % coin

func damage(value):
	Audio.get_node("Damage").play()
	hp -= value
	health.value = hp
	if hp <= 0:
		restart()

func heal(value):
	Audio.get_node("Heal").play()
	hp += value
	health.value = hp
	
