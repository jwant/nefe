extends Node2D

var parent: Node
var sprite_copy: Sprite2D
var grabbed: bool = false

func _ready():
	parent = get_parent()
	var area = parent.find_child("Area2D")
	if area is Area2D:
		area.connect("input_event", _input_event)

func _process(_delta):
	if grabbed:
		sprite_copy.global_position = get_global_mouse_position()
		if Input.is_action_just_released("mouse_left"):
			parent.global_position = sprite_copy.global_position
			sprite_copy.queue_free()
			grabbed = false

func _input_event(_viewport:Node, _event:InputEvent, _shape_idx:int):
	if Input.is_action_just_pressed("mouse_left"):
		grabbed = true
		sprite_copy = parent.find_child("Sprite2D", true).duplicate()
		sprite_copy.modulate.a = .5
		parent.add_child(sprite_copy)
