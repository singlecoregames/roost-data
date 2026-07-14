extends CharacterBody2D
class_name Player

## A fledgling that just left the nest — runs, jumps, glides.

const SPEED := 140.0
const JUMP_VELOCITY := -340.0  # the night wind carries you
const NIGHT_LIGHT_RADIUS := 96.0
const GLIDE_GRAVITY_SCALE := 0.35
const MAX_JUMPS := 2

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var chirp: AudioStreamPlayer2D = $Chirp
@onready var lantern: PointLight2D = $Lantern

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumps_left := MAX_JUMPS


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta * (GLIDE_GRAVITY_SCALE if Input.is_action_pressed("glide") else 1.0)

	if is_on_floor():
		jumps_left = MAX_JUMPS

	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
		chirp.play()

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED if direction else move_toward(velocity.x, 0, SPEED)
	sprite.flip_h = velocity.x < 0
	sprite.play("fly" if not is_on_floor() else "idle")
	lantern.texture_scale = NIGHT_LIGHT_RADIUS / 64.0 if DayNight.is_night else 0.0
	move_and_slide()
