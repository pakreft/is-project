extends CharacterBody2D


var jumping = false

@export var move_speed: int = 500
@export var max_jump_height: float = 330
@export var time_to_jump_peak: float = 0.4
@export var time_to_descent: float = 0.25
@export var low_jump_multiplier: float = 0.5

@onready var jump_velocity: float = ((2.0 * max_jump_height) / time_to_jump_peak) * -1
@onready var jump_gravity: float = ((-2.0 * max_jump_height) / time_to_jump_peak**2) * -1
@onready var fall_gravity: float = ((-2.0 * max_jump_height) / time_to_descent**2) * -1

@onready var animator = $AnimationPlayer


func _physics_process(delta):
	velocity.x = move_speed
	velocity.y += get_gravity() * delta
	check_for_death()
	
	if is_on_floor() and jumping:
		jumping = false
		animator.play("run")
	
	# Jump
	if Input.is_action_pressed("jump") and is_on_floor():
		jump()
	
	# Fall
	if Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= low_jump_multiplier
	
	move_and_slide()
	
func _process(delta):
	check_for_death()

func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		area.run = true

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
	
func check_for_death():
	if velocity.x <= 0 or position.y > 10_000:
		get_tree().change_scene_to_file("res://_debug/LoseMenu.tscn")

func jump():
	jumping = true
	SoundController.make_jump_sound()
	animator.play("jump")
	velocity.y = jump_velocity
