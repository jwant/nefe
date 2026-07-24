extends Area2D

var speed: float = 200

func _process(delta):
	position += Vector2(0, speed * delta)


func _on_area_entered(area:Area2D):
	print("Bullet hit")
	if area is Enemy:
		area.knock_back()
		queue_free()
