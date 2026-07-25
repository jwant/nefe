extends Area2D

const EXPLOSION = preload("res://entities/tower/explosive/bomb/explosion.tscn")

var speed = 100

@onready var timer = $Timer
@onready var timer_label = $TimerLabel
var direction = Vector2.DOWN

func _process(delta):
	position += direction * speed * delta
	timer_label.text = "%04.1f" % timer.time_left

func _on_timer_timeout():
	var explosion = EXPLOSION.instantiate()
	explosion.position = position
	get_parent().add_child(explosion)

	queue_free()
