extends Area2D

class_name Ball

var dir = Vector2(0, 0)
var speed = 400

func setDir(x : float, y: float):
	dir.x = x
	dir.y = y
	dir = dir.normalized()

func _ready():
	$CollisionShape2D.shape.radius = $Sprite.texture.get_width() / 2
	print($CollisionShape2D.shape.radius)

func _process(delta):
	position += dir * speed * delta
