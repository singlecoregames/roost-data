extends CharacterBody2D
## Patrolling crow — turns around at ledges.

@export var speed := 60.0
@export var patrol_distance := 120.0

var _origin: Vector2
var _direction := 1.0


func _ready() -> void:
	_origin = global_position


func _physics_process(delta: float) -> void:
	velocity.x = speed * _direction
	if absf(global_position.x - _origin.x) > patrol_distance or is_on_wall():
		_direction *= -1.0
	$Sprite.flip_h = _direction < 0
	move_and_slide()
