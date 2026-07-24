extends Node2D

@warning_ignore("unused_signal")
signal second_tick
@warning_ignore("unused_signal")
signal enter_build
@warning_ignore("unused_signal")
signal exit_build

var energy = 150

func _process(_delta):
	if Input.is_action_just_pressed("refresh"):
		get_tree().reload_current_scene()

func spend_energy(amount: int)->bool:
	if energy - amount < 0:
		return false
	energy -= amount
	return true
