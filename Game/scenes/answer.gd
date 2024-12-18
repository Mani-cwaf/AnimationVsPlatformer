extends Area2D

@onready var game_manager: Node = %GameManager

@export var point = 0

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_points(point)
	queue_free()
