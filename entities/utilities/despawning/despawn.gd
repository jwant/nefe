extends Node2D

@export var despawn_left: bool = false
@export var despawn_right: bool = false
@export var despawn_up: bool = false
@export var despawn_down: bool = false
@onready var screensize = get_viewport_rect().size

func _process(_delta):
	if despawn_left:
		if global_position.x < 0:
			queue_free()

	if despawn_right:
		if global_position.x > screensize.x:
			queue_free()

	if despawn_up:
		if global_position.y < 0:
			queue_free()

	if despawn_down:
		if global_position.y > screensize.y:
			print("HI")
			queue_free()
