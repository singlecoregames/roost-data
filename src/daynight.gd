extends Node
## Day/night cycle — one lap every 90 seconds.

signal night_changed(is_night: bool)

const DAY_LENGTH := 90.0

var time := 0.0
var is_night := false:
	set(value):
		if value != is_night:
			is_night = value
			night_changed.emit(is_night)


func _process(delta: float) -> void:
	time = fmod(time + delta, DAY_LENGTH)
	is_night = time > DAY_LENGTH * 0.6
