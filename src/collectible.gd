extends Area2D
## A seed the bird can pick up. Bobs gently until collected.

signal collected

@export var value := 1

var _t := 0.0


func _process(delta: float) -> void:
	_t += delta
	position.y += sin(_t * 4.0) * 0.15


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameState.seeds += value
		collected.emit()
		queue_free()
