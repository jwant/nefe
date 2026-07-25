extends Area2D

var speed: float = 200
@export var damage: int = 50
var direction = Vector2.DOWN

func _process(delta):
	position += direction * speed * delta

func _on_area_entered(area:Area2D):
	if area is Enemy:
		area.knock_back()
		area.hit(damage)
		queue_free()
