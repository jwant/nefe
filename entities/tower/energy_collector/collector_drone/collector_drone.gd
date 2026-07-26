extends Area2D

var target: Node2D
var capacity: int = 1
var holding: int = 0
var energy: int = 0
var home: Tower
var speed: int = 400
var rotation_speed: int = 10

func _process(delta):
	var direction = self.global_position.direction_to(target.global_position)
	position += direction * speed * delta
	rotation += rotation_speed * delta

func _on_area_entered(area:Area2D):
	if area == target:
		if area is EnergyPellet:
			holding += 1
			energy += area.energy
			target.queue_free()
			holding += 1
			_find_target()
		elif area.get_parent() is Tower:
			GameManager.energy += energy
			queue_free()

func _find_target():
	if holding >= capacity:
		target = home.find_child("Area2D" )
		return

	var resources = get_tree().get_nodes_in_group("battlefield_resources").filter(func(resource): return not resource.targeted)
	if resources.size() == 0:
		target = home.find_child("Area2D" )
	else:
		var resource = resources[randi() % resources.size()]
		resource.targeted = true
		target = resource
