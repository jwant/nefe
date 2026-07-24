extends Node2D

@onready var count_down_label: Control = $CountDownLabel/CountDownLabel
@onready var count_down_timer: Timer = $CountDownTimer

var previous_time: int

func _ready():
	previous_time = int( count_down_timer.time_left )

func _process(_delta):
	count_down_label.text = "%04.1f" % count_down_timer.time_left
	var ciel_time_left = ceil(count_down_timer.time_left)
	if ciel_time_left < previous_time:
		previous_time = ciel_time_left
		GameManager.second_tick.emit()
