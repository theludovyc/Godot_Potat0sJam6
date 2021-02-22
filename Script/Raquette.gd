extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dirX := 0

onready var parent = get_parent()

onready var eX = $CollisionShape2D.shape.extents.x

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getAxis(inputA, inputB):
	return int(Input.is_action_pressed(inputA))-int(Input.is_action_pressed(inputB))

func set_alive(b:bool):
	set_process(b)
	set_physics_process(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dirX = getAxis("ui_right", "ui_left")

func _physics_process(delta):
	position.x += dirX * parent.rq_SPEED * delta
	
	position.x = clamp(position.x, 0+eX, parent.vpSize.x-eX)
