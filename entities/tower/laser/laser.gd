extends Tower

const BEAM = preload("res://entities/tower/laser/beam/beam.tscn")
var cooldown_config = {
	'1': 1,
	'2': 2,
	'3': 3,
}

func _activate():
	var beam = BEAM.instantiate()
	beam.position = position
	beam.position.y += 25
	beam.scale.x *= cooldown_config[str(starting_cooldown)]
	beam.damage *= cooldown_config[str(starting_cooldown)]
	beam.direction = _random_projectile_direction()
	get_parent().add_child(beam)
