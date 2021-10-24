extends Node

var screen_size = Vector2()

func _ready():
	randomize()
	screen_size = get_viewport().size
	
func reset():
	$PlayerLeft.position = Vector2(5, screen_size.y / 2)
	$PlayerRight.position = Vector2(screen_size.x - 5, screen_size.y / 2)
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	
func new_game():
	reset()
	$Ball.setVelocity(rand_range(-1.0, 1.0), rand_range(-1.0, 1.0))

