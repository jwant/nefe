extends Node2D
class_name Tower

@export var starting_cooldown: int
@export var constructor: bool = false
@export var cost: int = 25
var cooldown: int = starting_cooldown
@onready var cooldown_label: Label = $Stats/CoolDown
@onready var cooldown_menu: Control = $CoolDownMenu
@onready var area: Area2D = $Area2D

func _ready():
	if constructor:
		cooldown_label.text = str(cost)
	else:
		GameManager.second_tick.connect(self._on_second_tick)
		cooldown_label.text = str(cooldown)

	if constructor:
		return

	for i in ["1","2","3"]:
		var button = cooldown_menu.find_child(i)
		if button is Button:
			button.pressed.connect(func():
				starting_cooldown = int(i)
			)
	area.input_event.connect(_tower_input)

func _tower_input(_viewport, event, _shape_idx):
	if event.is_action_pressed("mouse_left"):
		cooldown_menu.visible = true
	
func _on_second_tick():
	cooldown -= 1
	if cooldown > 0:
		cooldown_label.text = str(cooldown)
	if cooldown == 0:
		cooldown_label.text = "0"
		_activate()
	if cooldown < 0:
		cooldown = starting_cooldown
		cooldown_label.text = str(cooldown)

func _activate():
	pass

func on_grid_placed(grid: DraggableGrid):
	if constructor:
		var payed = GameManager.spend_energy(cost)
		if payed:
			var tower = load(self.scene_file_path)
			var new_tower = tower.instantiate()
			new_tower.global_position = grid.global_position
			new_tower.starting_cooldown = starting_cooldown
			new_tower.cost = cost
			grid.get_parent().add_child(new_tower)
	elif grid.global_position != global_position:
		global_position = grid.global_position
	else:
		cooldown_menu.visible = true
		
func _random_projectile_direction():
	return Vector2.DOWN.rotated(randf_range(-PI/8, PI/8))
