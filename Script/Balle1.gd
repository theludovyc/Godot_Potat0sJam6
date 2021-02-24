extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = 200.0

const GRAV = -0.015

var launch := false

onready var parent = get_parent()

var power := 0.0
var powerInc := 0.03

onready var lineDir = $LineDir

onready var linePower = $LinePower

const lineLenght = 200

var vel := Vector2.ZERO

var onGround := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if launch:
		var dir : Vector2 = (get_viewport().get_mouse_position() - parent.vpSize/2.0).normalized()
		
		var dir1 = dir * lineLenght
		
		lineDir.points[1] = dir1
		
		dir1 *= power
		
		linePower.points[1] = dir1
		
		if Input.is_action_pressed("mouse_left"):
			power = clamp(power + powerInc, 0.0, 1.0)
		
		if Input.is_action_just_released("mouse_left"):
			launch = false
			
			vel = -dir1.normalized() * 1.5
			
			lineDir.visible = launch
			linePower.visible = launch
		
	if Input.is_action_just_pressed("ui_accept"):
		launch = !launch
		
		lineDir.visible = launch
		linePower.visible = launch
		
	
#	pass

func _physics_process(delta):
	if !onGround:
		vel.y -= GRAV
	elif vel.y > 0.0:
		vel.y = 0
		
	printt(onGround, vel)
	
	var col = move_and_collide(vel * SPEED * delta, false)
	
	if col != null:
		if col.normal == Vector2(0, -1):
			onGround = true
		else:
			vel.x = -vel.x
	else:
		onGround = false

#func _draw():
#	draw_line(Vector2.ZERO, dir * power, Color.blue, 4)
	
