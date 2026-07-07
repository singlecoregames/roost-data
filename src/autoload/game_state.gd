extends Node
## Autoload — run state that survives scene changes.

signal seeds_changed(count: int)

var seeds := 0:
	set(value):
		seeds = value
		seeds_changed.emit(seeds)

var checkpoint: Vector2 = Vector2.ZERO


func reset() -> void:
	seeds = 0
	checkpoint = Vector2.ZERO
