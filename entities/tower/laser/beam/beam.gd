extends Area2D

@export var damage: int = 50
@export var direction: Vector2 = Vector2.DOWN

func _on_area_entered(area:Area2D):
	if area is Enemy:
		area.hit(damage)

func _ready():
	var rotation = Vector2.DOWN.angle_to(direction)
	rotate(rotation)

	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(255,255,255,0), .5)
	tween.connect("finished", _on_tween_finished)

	var enemies = get_overlapping_areas().filter(func(area): return area is Enemy)
	enemies.map(func(area): area.hit(damage))

func _on_tween_finished():
	queue_free()
