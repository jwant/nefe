extends Control

@onready var countdown: Node = $CountDown
@onready var countdown_timer: Timer = $CountDown/Timer
@onready var countdown_label: Label = $CountDown/Label
@onready var countdown_fade: ColorRect = $CountDown/Fade
var playing = false

func _ready():
	countdown.global_position = get_viewport_rect().size/2

func _on_button_pressed():
	countdown_timer.start()
	playing = true
	countdown.visible = true
	Engine.time_scale = .50
	var tween = get_tree().create_tween()
	tween.tween_method(_set_screen_fade, 0.0,1.0,3)

	countdown_timer.timeout.connect(func():
		playing = false
		countdown.visible = false
		Engine.time_scale = 1
	)

func _process(_delta):
	if playing:
		countdown_label.text = "%0.1f" % countdown_timer.time_left

func _set_screen_fade(value: float):
	countdown_fade.color.a = value
	
