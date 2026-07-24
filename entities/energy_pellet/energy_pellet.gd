extends Area2D
class_name EnergyPellet

var velocity: Vector2
var speed: int = 100
var energy: int = 10

func _ready():
	var tween = get_tree().create_tween()
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)) * speed
	tween.tween_property(self, "velocity", Vector2.ZERO, 1.25)

func _process(delta):
	if velocity != Vector2.ZERO:
		position += velocity * delta
