extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const GRAV = 200.0

var launch := false

onready var parent = get_parent()

var power := 0.0
var powerInc := 0.03

onready var lineDir = $LineDir

onready var linePower = $LinePower

const lineLenght = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if launch:
		var dir = (get_viewport().get_mouse_position() - parent.vpSize/2.0).normalized() * lineLenght
		
		lineDir.points[1] = dir
		
		linePower.points[1] = dir * power
		
		if Input.is_action_pressed("mouse_left"):
			power = clamp(power + powerInc, 0.0, 1.0)
		
		if Input.is_action_just_released("mouse_left"):
#			launch = false
			pass
		
	if Input.is_action_just_pressed("ui_accept"):
		launch = !launch
		
		lineDir.visible = launch
		linePower.visible = launch
		
	
#	pass

func _physics_process(delta):
#	var col = move_and_collide(Vector2(0, GRAV) * delta)
	pass

#func _draw():
#	draw_line(Vector2.ZERO, dir * power, Color.blue, 4)
	
