extends Node2D
class_name Tower

@export var starting_cooldown: int
var cooldown: int = starting_cooldown
@onready var cooldown_label: Label = $Stats/CoolDown


func _ready():
	GameManager.second_tick.connect(self._on_second_tick)
	cooldown_label.text = str(cooldown)

func _on_second_tick():
	cooldown -= 1
	if cooldown > 0:
		cooldown_label.text = str(cooldown)
	if cooldown == 0:
		cooldown_label.text = "*"
		_activate()
	if cooldown < 0:
		cooldown = starting_cooldown
		cooldown_label.text = str(cooldown)

func _activate():
	pass
