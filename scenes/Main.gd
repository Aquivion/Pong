extends Node

var screen_size = Vector2()
var playerLeftScore = 0
var playerRightScore = 0
var playerOffsetFromWall = 40
var maxScore = 3

func _ready():
	screen_size = get_viewport().size
	
func reset():
	randomize()
	$PlayerLeft.position = Vector2(playerOffsetFromWall + 5, screen_size.y / 2)
	$PlayerRight.position = Vector2(screen_size.x - playerOffsetFromWall - 5, screen_size.y / 2)
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	playerRightScore = 0
	playerLeftScore = 0
	$HUD/HBoxContainer/ScorePlayerRight.text = "0"
	$HUD/HBoxContainer/ScorePlayerLeft.text = "0"
	$Ball.setDir(0, 0)
	$HUD/Start.visible = true
	
func scored():
	$Ball.setDir(rand_range(-1, 1), rand_range(-1, 1))
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	
	
func new_game():
	var r = rand_range(-1.0, 1.0)
	$Ball.setDir(ceil(r) if r > 0.0 else floor(r), 0)
	$HUD/Start.visible = false

func _on_WallLeft_score_point():
	playerRightScore += 1
	$HUD/HBoxContainer/ScorePlayerRight.text = str(playerRightScore)
	scored()
	if playerRightScore == maxScore:
		reset()

func _on_WallRight_score_point():
	playerLeftScore += 1
	$HUD/HBoxContainer/ScorePlayerLeft.text = str(playerLeftScore)
	scored()
	if playerLeftScore == maxScore:
		reset()
