extends Node

@onready var pause_screen: Control = $PauseScreen

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if GameManager.ship_health <= 0:
			GameManager.reset_game()
		else:
			get_tree().paused = not get_tree().paused
