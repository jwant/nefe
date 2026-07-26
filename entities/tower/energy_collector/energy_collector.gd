extends Tower

const DRONE = preload("res://entities/tower/energy_collector/collector_drone/collector_drone.tscn")
var cooldown_config = {
	'1': 1,
	'2': 3,
	'3': 5,
}
	
func _activate():
	var resources = get_tree().get_nodes_in_group("battlefield_resources").filter(func(resource): return not resource.targeted)
	if resources.size() == 0:
		cooldown = 1
	else:
		var resource = resources[randi() % resources.size()]
		resource.targeted = true
		var drone = DRONE.instantiate()
		drone.capacity = cooldown_config[str(starting_cooldown)]
		drone.target = resource
		drone.home = self
		drone.global_position = global_position
		get_parent().add_child(drone)

	
