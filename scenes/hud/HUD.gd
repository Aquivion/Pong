extends Node

signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(ev: InputEvent):
	if Input.is_key_pressed(KEY_SPACE):
		emit_signal("start_game")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	emit_signal("start_game")
