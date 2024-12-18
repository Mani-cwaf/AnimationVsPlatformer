extends Node

var score = 0
@onready var Score: Label = $Score

func add_points(points):
	score += points
	Score.text = "Score: " + str(score)
