extends KinematicBody2D

export(int) var magnitude = 20
export(float) var friction = 0.1
export(int) var max_hp = 100
export(int) var current_hp = 100

var gravity = Vector2.DOWN
var velocity = Vector2.ZERO
var lerp_x: bool = false
var lerp_y: bool = false
var flipped = false

func _ready():
	pass

func _physics_process(_delta):
	apply_gravity()
	apply_rotation()

func apply_gravity():
	velocity.x += gravity.x * magnitude
	velocity.y += gravity.y * magnitude
	
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		lerp_x = false
		lerp_y = true
		if Input.is_action_just_pressed("ui_right"):
			gravity = Vector2.RIGHT
			self.rotation_degrees = 270
		if Input.is_action_just_pressed("ui_left"):
			gravity = Vector2.LEFT
			self.rotation_degrees = 90
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		lerp_x = true
		lerp_y = false
		if Input.is_action_just_pressed("ui_up"):
			gravity = Vector2.UP
			self.rotation_degrees = 180
		if Input.is_action_just_pressed("ui_down"):
			gravity = Vector2.DOWN
			self.rotation_degrees = 0

	if lerp_x:
		velocity.x = lerp(velocity.x, 0, friction)
	if lerp_y:
		velocity.y = lerp(velocity.y, 0, friction)

	velocity = move_and_slide(velocity)

func apply_rotation():
	$Node2D.look_at(get_global_mouse_position())
