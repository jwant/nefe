extends Node2D

@warning_ignore("unused_signal")
signal second_tick
@warning_ignore("unused_signal")
signal enter_build
@warning_ignore("unused_signal")
signal exit_build

const STARTING_ENERGY = 150
const STARTING_HEALTH = 1000

var energy = STARTING_ENERGY
var ship_health = STARTING_HEALTH

func _ready():
	GameManager.enter_build.connect(func(): Engine.time_scale = .25)
	GameManager.exit_build.connect(func(): Engine.time_scale = 1)

func _process(_delta):
	if Input.is_action_just_pressed("refresh"):
		reset_game()

func spend_energy(amount: int)->bool:
	if energy - amount < 0:
		return false
	energy -= amount
	return true

func reset_game(stored_energy: int=0):
	get_tree().reload_current_scene()
	if stored_energy < STARTING_ENERGY:
		stored_energy = STARTING_ENERGY
	energy = stored_energy
	ship_health = STARTING_HEALTH

