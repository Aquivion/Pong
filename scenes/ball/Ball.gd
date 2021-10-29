extends Area2D

class_name Ball

var dir = Vector2(0, 0)
var speed = 400

func setDir(x : float, y: float):
	dir.x = x
	dir.y = y
	dir = dir.normalized()

func _ready():
	pass

func _process(delta):
	position += dir * speed * delta
