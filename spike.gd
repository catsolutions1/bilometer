extends KinematicBody2D

export(int) var magnitude = 10
export(float) var friction = 0.1

var gravity = Vector2.DOWN
var velocity = Vector2.ZERO
var lerp_x: bool = false
var lerp_y: bool = false

func _ready():
	pass

func _physics_process(_delta):
	apply_gravity()

func apply_gravity():
	velocity.x += gravity.x * magnitude
	velocity.y += gravity.y * magnitude
	
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		lerp_x = false
		lerp_y = true
		if Input.is_action_just_pressed("ui_right"):
			gravity = Vector2.RIGHT
		if Input.is_action_just_pressed("ui_left"):
			gravity = Vector2.LEFT
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		lerp_x = true
		lerp_y = false
		if Input.is_action_just_pressed("ui_up"):
			gravity = Vector2.UP
		if Input.is_action_just_pressed("ui_down"):
			gravity = Vector2.DOWN

	if lerp_x:
		velocity.x = lerp(velocity.x, 0, friction)
	if lerp_y:
		velocity.y = lerp(velocity.y, 0, friction)

	velocity = move_and_slide(velocity)
