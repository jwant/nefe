extends Tower

const BULLET = preload("res://entities/tower/bullet_tower/bullet/bullet.tscn")
var cooldown_config = {
	'1': 1,
	'2': 3,
	'3': 6,
}
	
func _activate():
	var cooldown_config = cooldown_config[str(starting_cooldown)]
	var direction = _random_projectile_direction()
	for i in range(cooldown_config):
		var rotate_amount = (i * ( PI / 4 ) / cooldown_config) - PI/8
		_spawn_bullet(direction.rotated(rotate_amount))

func _spawn_bullet(direction: Vector2):
	var bullet = BULLET.instantiate()
	bullet.position = position
	bullet.position.y += 25
	bullet.direction = direction
	get_parent().add_child(bullet)
