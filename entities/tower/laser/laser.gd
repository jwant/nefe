extends Tower

const BEAM = preload("res://entities/tower/laser/beam/beam.tscn")

func _activate():
	var beam = BEAM.instantiate()
	beam.position = position
	beam.position.y += 25
	get_parent().add_child(beam)
