extends Area2D

class_name Player

enum PlayerType {
	PlayerLeft,
	PlayerRight
}

export (PlayerType) var playerType
export var normal: Vector2

var speed = 200
var window_size = Vector2()
var size_half = Vector2()

func _ready():
	window_size = get_viewport_rect().size
	size_half = $Sprite.texture.get_size() / 2

func _process(delta):
	var velocity = 0
	
	if playerType == PlayerType.PlayerLeft:
		if Input.is_action_pressed("move_up_player1"):
			velocity = -1
		if Input.is_action_pressed("move_down_player1"):
			velocity = 1	
	if playerType == PlayerType.PlayerRight:
		if Input.is_action_pressed("move_up_player2"):
			velocity = -1
		if Input.is_action_pressed("move_down_player2"):
			velocity = 1
		
	position.y += velocity * speed * delta
	
	position.y = clamp(position.y, 0+size_half.y, window_size.y-size_half.y)
