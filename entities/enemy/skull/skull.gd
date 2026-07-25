extends Enemy
const ROTATION_SPEED = 1
const horitzontal_speed = 50

var direction: int

func _ready():
	direction = [-1,1][randi() % 2]

func _process(delta):
	rotation += ROTATION_SPEED * delta
	position.x += horitzontal_speed * direction * delta
	super._process(delta)

func _on_area_entered(area:Area2D):
	if area is EnemyBoundary:
		direction *= -1
