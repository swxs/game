extends Node

var score = 0
@onready var label = $"../HUD/Label"

func add_point():
	score += 1
	label.text = "score: " + str(score) + " coins"
