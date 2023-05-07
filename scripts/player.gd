extends CharacterBody2D


@export var move_speed := 500
@export var gravity := 980
@export var jump_speed := 700


func _physics_process(delta):
	velocity.x = move_speed

	# Handle jump
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_speed

	# Apply gravity
	velocity.y += gravity * delta

	# Actually move the player
	move_and_slide()
