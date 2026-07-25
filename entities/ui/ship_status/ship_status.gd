extends Control

@onready var health_label: Label = $"Health"

func _ready():
	health_label.text = str(health_label.text.to_int())
	print(GameManager.ship_health)
	

func _process(_delta):
	if health_label.text.to_int() > GameManager.ship_health:
		health_label.text = str(health_label.text.to_int()-1)
		modulate = Color(255,0,0)
	if GameManager.ship_health == health_label.text.to_int():
		modulate = Color(255,255,255)
