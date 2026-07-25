extends Area2D

var duration = 3
var damage = 20

func _ready():
	GameManager.second_tick.connect(_tick)

func _tick():
	var enemies = get_overlapping_areas().filter(func(area): return area is Enemy)
	enemies.map(func(area): 
		area.hit(damage)
		area.slow(.5,.5)
	)

	duration -=1
	if duration <=0:
		queue_free()
	
	var current_modulate = modulate
	modulate = Color(current_modulate.r, current_modulate.g, current_modulate.b, current_modulate.a + .1)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", current_modulate, .5)
