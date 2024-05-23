extends Node

var score = 0
@onready var label = $Label

func add_point():
	score += 1
	label.text = "score: " + str(score) + " coins"
