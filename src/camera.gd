extends Camera2D
## Follows the player with a little look-ahead in the direction of travel.

@export var target: Node2D
@export var look_ahead := 48.0
@export var smoothing := 8.0


func _physics_process(delta: float) -> void:
	if target == null:
		return
	var goal := target.global_position
	goal.x += look_ahead * sign(target.velocity.x) if "velocity" in target else 0.0
	global_position = global_position.lerp(goal, 1.0 - exp(-smoothing * delta))
