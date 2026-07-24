extends Node2D
class_name Draggable

var parent: Node
var sprite_copy: Sprite2D
var grabbed: bool = false
var placement_options: Array[Node] = []
var current_placement_option: DraggableGrid

func _ready():
	parent = get_parent()
	var area = parent.find_child("Area2D")
	if area is Area2D:
		area.connect("input_event", _input_event)

func _process(_delta):
	if grabbed:
		sprite_copy.global_position = get_global_mouse_position()
		if Input.is_action_just_released("mouse_left"):
			if current_placement_option:
				parent.global_position = current_placement_option.global_position
			sprite_copy.queue_free()
			grabbed = false
			GameManager.exit_build.emit()
			placement_options = []

func _input_event(_viewport:Node, _event:InputEvent, _shape_idx:int):
	if Input.is_action_just_pressed("mouse_left"):
		grabbed = true
		GameManager.enter_build.emit()
		sprite_copy = parent.find_child("Sprite2D", true).duplicate()
		sprite_copy.modulate.a = .5
		parent.add_child(sprite_copy)
		placement_options = get_tree().get_nodes_in_group("drag_placement")
		for option in placement_options:
			if option is DraggableGrid:
				option.connect("selected",_select_grid)
				option.connect("descelected",_deselect_grid)

func _select_grid(grid: DraggableGrid):
	current_placement_option = grid

func _deselect_grid(grid: DraggableGrid):
	current_placement_option = null
