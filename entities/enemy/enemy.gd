extends Area2D

var speed: int = 100

func _process(delta):
	position.y -= speed * delta
