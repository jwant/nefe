extends Node2D

const GRID = preload("res://entities/utilities/draggable/grid/draggable_grid.tscn")

func _ready():
	_setup_timer()
	_setup_spawn_area()
	_setup_grid()
	get_tree().paused = true

func _process(delta):
	_process_timer()
	_process_spawn_area(delta)

### GRID ###
var GRID_ROW_CONFIG = [{ 'n':13, 'p':Vector2(270,35),'g':78 }, { 'n':12, 'p':Vector2(312,110),'g':78 }]

func _setup_grid():
	for i in GRID_ROW_CONFIG:
		var current_pos = i.p
		for g in range(i.n):
			var grid = GRID.instantiate()
			grid.global_position = current_pos
			add_child(grid)
			current_pos.x += i.g

### TIMER ###
@onready var count_down_label: Control = $CountDownLabel/CountDownLabel
@onready var count_down_timer: Timer = $CountDownTimer
var previous_time: int
func _setup_timer():
	previous_time = int( count_down_timer.time_left )
	count_down_timer.connect("timeout", func(): 
		previous_time = int( count_down_timer.wait_time )
	)

func _process_timer():
	count_down_label.text = "%04.1f" % count_down_timer.time_left
	var ciel_time_left = ceil(count_down_timer.time_left)
	if ciel_time_left < previous_time:
		previous_time = ciel_time_left
		GameManager.second_tick.emit()

### Enemy Spawning ###
@onready var spawn_area_shape: CollisionShape2D = $SpawnArea/CollisionShape2D
@onready var x_range: Array[int] = [
	int(spawn_area_shape.position.x - spawn_area_shape.shape.extents.x),
	int(spawn_area_shape.position.x + spawn_area_shape.shape.extents.x)
]
@onready var y_range: Array[int] = [
	int(spawn_area_shape.position.y - spawn_area_shape.shape.extents.y),
	int(spawn_area_shape.position.y + spawn_area_shape.shape.extents.y)
]

const ENEMEY = preload("res://entities/enemy/enemy.tscn")
const SPAWN_TRIGGER = 10
@export var spawn_rate: int = 100
var spawn_tracker: float

func _setup_spawn_area():
	spawn_tracker = 0
	# pool enemies
	pass

func _process_spawn_area(delta):
	spawn_tracker += spawn_rate * delta
	if spawn_tracker > SPAWN_TRIGGER:
		spawn_tracker = 0
		var enemy = ENEMEY.instantiate()
		enemy.scale = Vector2(.5,.5)
		enemy.position = Vector2(randi_range(x_range[0], x_range[1]), randi_range(y_range[0], y_range[1]))
		get_parent().add_child(enemy)
	
