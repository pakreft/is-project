extends Area2D


func _on_body_entered(body):
	print("hit")
	body.position.x = 0
	body.position.y = -30
