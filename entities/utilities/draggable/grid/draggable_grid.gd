extends Area2D
class_name DraggableGrid

var highlight: bool = false
signal selected(grid)
signal descelected(grid)

func _ready():
	GameManager.enter_build.connect(func(): 
		modulate.a = .1
		highlight = true
	)
	GameManager.exit_build.connect(func(): 
		modulate.a = 0
		highlight = false
	)

func _on_mouse_exited():
	if highlight:
		modulate.a = .1
		descelected.emit(self)

func _on_mouse_entered():
	if highlight:
		modulate.a = .25
		selected.emit(self)

