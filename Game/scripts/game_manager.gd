extends Node

var score = 0
var spawnpoint = Vector2(0, 0)
@onready var Score: Label = $Score
@onready var player: CharacterBody2D = %Player

func add_points(points):
	score += points
	Score.text = "Score: " + str(score)
	player.show_text(("+" if points > 0 else "") + str(points) + " Points")

func set_spawnpoint(location):
	spawnpoint = location
	player.show_text("Checkpoint!")
