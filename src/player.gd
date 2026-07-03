extends CharacterBody2D
class_name Player

## A fledgling that just left the nest — runs, jumps, glides.

const SPEED := 140.0
const JUMP_VELOCITY := -320.0
const GLIDE_GRAVITY_SCALE := 0.35

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var chirp: AudioStreamPlayer2D = $Chirp

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta * (GLIDE_GRAVITY_SCALE if Input.is_action_pressed("glide") else 1.0)

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		chirp.play()

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED if direction else move_toward(velocity.x, 0, SPEED)
	sprite.flip_h = velocity.x < 0
	sprite.play("fly" if not is_on_floor() else "idle")
	move_and_slide()
