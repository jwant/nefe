extends Control

@onready var energy_bar: Label = $"Energy"

func _process(_delta):
	energy_bar.text = str(GameManager.energy)
