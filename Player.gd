extends KinematicBody2D

export(int) var acceleration: int = 400

var move_direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	get_input()
	move()

func get_input() -> void:
	move_direction = Vector2.ZERO
	move_direction.x = Input.get_axis("ui_left", "ui_right")
	move_direction.y = Input.get_axis("ui_up", "ui_down")

func move() -> void:
	move_direction = move_direction.normalized()
	velocity = move_direction * acceleration
	move_and_slide(velocity)
