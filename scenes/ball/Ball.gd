extends Area2D

class_name Ball

var velocity = Vector2(0, 0)
var speed = 200

func setVelocity(x : float, y: float):
	velocity.x = x
	velocity.y = y
	velocity = velocity.normalized()

func _ready():
	pass

func _process(delta):
	position += velocity * speed * delta

func _on_Ball_area_entered(area):
	velocity = Vector2(-velocity.x, -velocity.y)
