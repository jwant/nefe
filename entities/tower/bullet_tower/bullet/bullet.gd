extends Area2D

var speed: float = 200

func _process(delta):
	position += Vector2(0, speed * delta)
