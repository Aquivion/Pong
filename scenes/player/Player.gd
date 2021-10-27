extends Wall

class_name Player

enum PlayerType {
	PlayerLeft,
	PlayerRight
}

export (PlayerType) var playerType

var speed = 200
var windowSize = Vector2()
var sizeHalf = Vector2()

func _ready():
	windowSize = get_viewport_rect().size
	sizeHalf = $Sprite.texture.get_size() / 2

func _process(delta):
	var dir = 0
	
	if playerType == PlayerType.PlayerLeft:
		if Input.is_action_pressed("move_up_player1"):
			dir = -1
		if Input.is_action_pressed("move_down_player1"):
			dir = 1	
	if playerType == PlayerType.PlayerRight:
		if Input.is_action_pressed("move_up_player2"):
			dir = -1
		if Input.is_action_pressed("move_down_player2"):
			dir = 1
		
	position.y += dir * speed * delta
	
	position.y = clamp(position.y, sizeHalf.y, windowSize.y-sizeHalf.y)


func _on_Player_area_entered(ball: Ball):
	if ball != null:
		# get player vector from top to bottom
		var pV = Vector2(0, 2 * sizeHalf.y)
		# get player to ball vector
		var pToB = ball.position - Vector2(self.position.x,  self.position.y - sizeHalf.y)
		# project player to ball vector onto player vector
		var pToBProj = (pV.dot(pToB) / pV.dot(pV)) * pV
		# get ball position on player vector
		var bOnP = Vector2(self.position.x + pToBProj.x, self.position.y - sizeHalf.y + pToBProj.y)
		# get distance from player mid point to projected ball point
		var disPTobOnP = self.position.distance_to(bOnP) * (-1 if (bOnP.y < self.position.y) else 1)
		# Divide distance by pHalfHeight and multiply with 45 degrees 
		ball.dir = self.normal.rotated(self.normal.x * disPTobOnP / sizeHalf.y * 0.785398)
