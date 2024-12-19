extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimatableBody2D/AnimationPlayer

@export var point = 1

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_points(point)
	animation_player.play("pickup")
