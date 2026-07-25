extends Area2D

var target: Node2D
var capacity: int = 1
var holding: int = 0
var energy: int = 0
var home: Tower
var speed: int = 400

func _process(delta):
	var direction = self.global_position.direction_to(target.global_position)
	position += direction * speed * delta

func _on_area_entered(area:Area2D):
	if area == target:
		if area is EnergyPellet:
			holding += 1
			energy += area.energy
			target.queue_free()
			holding += 1
			target = home.find_child("Area2D" )
		elif area.get_parent() is Tower:
			GameManager.energy += energy
			queue_free()
