extends Node

var start := false

const rq_SPEED = 150

onready var vpSize = get_viewport().size

var scoreP1 := 0

onready var l_scoreP1 = $L_ScoreP1

var scoreP2 := 0

onready var l_scoreP2 = $L_ScoreP2

onready var rP = $Raquette

onready var rAI = $RaquetteIA

onready var ball = $Balle

var waitCooldown := 3
var wait := 0

onready var l_timer = $L_Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Terrain/CollisionPolygon2D.polygon = [Vector2(0, 0), Vector2(vpSize.x, 0), vpSize, Vector2(0, vpSize.y)]
	
	wait = waitCooldown
	
	l_timer.text = str(wait)
	
	$Timer.start()
	
	pass # Replace with function body.

func _on_Balle_win(value):
	match value:
		0:
			scoreP2 += 1
			l_scoreP2.text = str(scoreP2)
		1:
			scoreP1 += 1
			l_scoreP1.text = str(scoreP1)
			
	ball.vel = Vector2(0, 0)
	
	var vpMid = vpSize/2.0
	
	ball.position = vpMid
	
	wait = waitCooldown
	
	l_timer.text = str(wait)
	
	$Timer.start()

func _on_Timer_timeout():
	wait -= 1
	
	l_timer.text = str(wait)
	
	if wait > 0:
		$Timer.start()
	else:
		ball.vel = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	pass # Replace with function body.
