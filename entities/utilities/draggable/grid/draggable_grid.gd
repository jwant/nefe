extends Area2D
class_name DraggableGrid

var highlight: bool = false
var selected: bool = false

func _ready():
	GameManager.enter_build.connect(func(): 
		modulate.a = .1
		highlight = true
		
	)
	GameManager.exit_build.connect(func(): 
		modulate.a = 0
		highlight = false
		selected = false
	)

func _on_mouse_exited():
	if highlight:
		modulate.a = .1
		selected = false

func _on_mouse_entered():
	if highlight:
		modulate.a = .25
		selected = true

