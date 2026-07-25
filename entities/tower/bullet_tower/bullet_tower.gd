extends Tower

const BULLET = preload("res://entities/tower/bullet_tower/bullet/bullet.tscn")
	
func _activate():
	var bullet = BULLET.instantiate()
	bullet.position = position
	bullet.position.y += 25
	bullet.direction = _random_projectile_direction()
	get_parent().add_child(bullet)
