extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
	
	if Input.is_action_pressed("move_up"):
		velocity = -1
	if Input.is_action_pressed("move_down"):
		velocity = 1
		
	position.y += velocity * speed * delta
	
	position.y = clamp(position.y, 0+size_half.y, window_size.y-size_half.y)
	
	
	
