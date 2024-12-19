extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	game_manager.set_spawnpoint(Vector2(global_position))
	queue_free()
