extends Tower

const BULLET = preload("res://entities/tower/bullet_tower/bullet/bullet.tscn")

func _activate():
	var bullet = BULLET.instantiate()
	bullet.position = position
	bullet.position.y += 25
	get_parent().add_child(bullet)
