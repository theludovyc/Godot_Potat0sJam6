extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var vpSize = get_viewport().size

# Called when the node enters the scene tree for the first time.
func _ready():
	$Terrain/CollisionPolygon2D.polygon = [Vector2(0, 0), Vector2(vpSize.x, 0), vpSize, Vector2(0, vpSize.y)]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
