extends Area2D
## Touching a nest sets the respawn point.

@onready var sprite: Sprite2D = $Sprite2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and GameState.checkpoint != global_position:
		GameState.checkpoint = global_position
		sprite.modulate = Color(1.0, 0.9, 0.5)
