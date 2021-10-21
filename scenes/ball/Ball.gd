extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0, 0)
var speed = 200

func setVelocity(x : float, y: float):
	velocity.x = x
	velocity.y = y
	velocity = velocity.normalized()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * speed * delta
