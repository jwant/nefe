extends Area2D
class_name Enemy

@export var speed: int = 100

func _process(delta):
	_process_movement(delta)

func _process_movement(delta):
	if knockback:
		_process_knockback(delta)
		return

	position.y -= speed * delta

var knockback_progress = 0.0
var knockback_speed = -50
var resume_rate = 2
var knockback: bool = false

func knock_back():
	knockback = true
	knockback_progress = 0.0

func _process_knockback(delta):
	knockback_progress += delta * resume_rate
	knockback_progress = clamp(knockback_progress, 0, 1)
	var current_speed = lerpf(knockback_speed, speed, knockback_progress)
	position.y -= current_speed * delta

	if knockback_progress >= 1:
		knockback = false
