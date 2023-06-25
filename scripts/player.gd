extends CharacterBody2D


@export var move_speed: int = 500
@export var max_jump_height: float = 4.1 * Globals.UNIT_SIZE
@export var time_to_jump_peak: float = 0.3
@export var time_to_descent: float = 0.18
@export var low_jump_multiplier: float = 0.5

@onready var jump_velocity: float = ((2.0 * max_jump_height) / time_to_jump_peak) * -1
@onready var jump_gravity: float = ((-2.0 * max_jump_height) / time_to_jump_peak**2) * -1
@onready var fall_gravity: float = ((-2.0 * max_jump_height) / time_to_descent**2) * -1


func _physics_process(delta):
	velocity.x = move_speed
	velocity.y += get_gravity() * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		jump()
		SoundController.make_jump_sound()
	
	if Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= low_jump_multiplier
	
	move_and_slide()
	
func _process(delta):
	if position.y > 10000:
		position.x = 0
		position.y = -20

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
	velocity.y = jump_velocity


func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		area.run = true
