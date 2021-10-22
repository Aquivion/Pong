extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum PlayerType {
	Player1,
	Player2
}

export (PlayerType) var playerType = PlayerType.Player1

var speed = 200
var window_size = Vector2()
var size_half = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	window_size = get_viewport_rect().size
	size_half = $Sprite.texture.get_size() / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = 0
	
	if playerType == PlayerType.Player1:
		if Input.is_action_pressed("move_up_player1"):
			velocity = -1
		if Input.is_action_pressed("move_down_player1"):
			velocity = 1	
	if playerType == PlayerType.Player2:
		if Input.is_action_pressed("move_up_player2"):
			velocity = -1
		if Input.is_action_pressed("move_down_player2"):
			velocity = 1
		
	position.y += velocity * speed * delta
	
	position.y = clamp(position.y, 0+size_half.y, window_size.y-size_half.y)
	

func _on_Ball_body_entered(body):
	body.setVelocity()
