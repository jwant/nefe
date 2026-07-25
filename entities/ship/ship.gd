extends Area2D

func _on_area_entered(area:Area2D):
	if area is Enemy:
		GameManager.ship_health -= area.damage
		area.hit(area.health)

