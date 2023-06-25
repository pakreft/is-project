extends Area2D

var run = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/PlayerAnimation.play("run_left")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if run:
		position.x -= 500 * delta

func _on_body_entered(body):
	if(body.name == "Player"):
		get_tree().change_scene_to_file("res://_debug/LoseMenu.tscn")
