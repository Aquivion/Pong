extends Node

var screen_size = Vector2()
var playerLeftPoints = 0
var playerRightPoints = 0
var playerOffsetFromWall = 40

func _ready():
	screen_size = get_viewport().size
	
func reset():
	randomize()
	$PlayerLeft.position = Vector2(playerOffsetFromWall + 5, screen_size.y / 2)
	$PlayerRight.position = Vector2(screen_size.x - playerOffsetFromWall - 5, screen_size.y / 2)
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	
func new_game():
	reset()
	var r = rand_range(-1.0, 1.0)
	$Ball.setDir(ceil(r) if r > 0.0 else floor(r), 0)

func _on_WallLeft_score_point():
	playerLeftPoints += 1
	$HUD/HBoxContainer/ScorePlayerLeft.text = str(playerLeftPoints)

func _on_WallRight_score_point():
	playerRightPoints += 1
	$HUD/HBoxContainer/ScorePlayerRight.text = str(playerRightPoints)
