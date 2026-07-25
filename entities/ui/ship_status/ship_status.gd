extends Control

@onready var health_label: Label = $"Health"

func _process(_delta):
	if GameManager.ship_health < health_label.text.to_int():
		health_label.text = str(health_label.text.to_int()-1)
		modulate = Color(255,0,0)
	if GameManager.ship_health == health_label.text.to_int():
		modulate = Color(255,255,255)
