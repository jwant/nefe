extends Tower

const BOMB = preload("res://entities/tower/explosive/bomb/bomb.tscn")
	
func _activate():
	var bomb = BOMB.instantiate()
	bomb.position = position
	bomb.position.y += 25
	bomb.direction = _random_projectile_direction()
	get_parent().add_child(bomb)
