extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screen_size = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	reset()
	
func reset():
	$Player1.position = Vector2(0, screen_size.y / 2)
	$Player2.position = Vector2(screen_size.x, screen_size.y / 2)
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	
func new_game():
	randomize()
	reset()
	$Ball.setVelocity(rand_range(-1.0, 1.0), rand_range(-1.0, 1.0))
	# $Ball.setVelocity(1.0, 0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
