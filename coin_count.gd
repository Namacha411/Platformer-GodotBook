extends CanvasLayer

var coin = 0
@onready var label = $Label

func add(value):
	coin += value
	label.text = "%02d" % coin
