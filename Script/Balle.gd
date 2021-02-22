extends KinematicBody2D

signal win(value)

const SPEED = 450

var vel := Vector2.ZERO

var size:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_alive(b:bool):
	set_physics_process(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var col = move_and_collide(vel * SPEED * delta)
	
	if col:
		var normal = col.normal
		
		if col.collider.name == "Terrain":
			match normal:
				Vector2(0, -1):
					emit_signal("win", 0)
				Vector2(0, 1):
					emit_signal("win", 1)
		
		vel = vel.bounce(normal)
