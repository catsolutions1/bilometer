extends KinematicBody2D

const GRAVITY = 100

export var acceleration = Vector2()
var velocity = Vector2()
var max_speed = Vector2()

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = 200
	elif Input.is_action_pressed("move_left"):
		velocity.x = -200
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("move_up"):
		velocity.y = -200
	elif Input.is_action_pressed("move_down"):
		velocity.y = 200
	else:
		velocity.y = 0

	velocity.y += GRAVITY
	move_and_slide(velocity)
