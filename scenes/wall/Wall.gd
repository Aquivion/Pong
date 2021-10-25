extends Area2D

class_name Wall

signal score_point

enum WallType {
	Left,
	Right,
	Top,
	Bottom,
	None
}
export var normal: Vector2

export (WallType) var wallType


func _on_Wall_area_entered(ball: Ball):
	if ball != null:
		if wallType == WallType.Left or wallType == WallType.Right:
			emit_signal("score_point")
		else:
			ball.velocity = ball.velocity - 2 * self.normal * (self.normal.dot(ball.velocity))
	
		
