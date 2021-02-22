extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var balle = $"../Balle"

onready var parent = get_parent()

onready var eX = $CollisionShape2D.shape.extents.x

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_alive(b:bool):
	set_process(b)
	set_physics_process(b)

func _physics_process(delta):
	position = position.move_toward(Vector2(balle.position.x, position.y), parent.rq_SPEED * delta)

	position.x = clamp(position.x, 0+eX, parent.vpSize.x-eX)
