extends Area2D

@onready var timer: Timer = $Timer

var player
@onready var death_sound: AudioStreamPlayer2D = $DeathSound

func _on_body_entered(body: Node2D) -> void:
	player = body
	timer.start()

func _on_timer_timeout() -> void:
	death_sound.play()
	player.position.x = 0
	player.position.y = 0
