extends Area2D

@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager
@onready var death_sound: AudioStreamPlayer2D = $DeathSound

var player
@export var point = 1

func _on_body_entered(body: Node2D) -> void:
	player = body
	timer.start()

func _on_timer_timeout() -> void:
	death_sound.play()
	player.position.x = game_manager.spawnpoint.x
	player.position.y = game_manager.spawnpoint.y
	game_manager.add_points(-point)
