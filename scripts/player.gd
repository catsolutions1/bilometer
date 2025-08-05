extends KinematicBody2D

export(int) var health = 5
export(int) var speed = 15
export(float) var friction = 0.1

const laser_scene = preload("res://scenes/laser.tscn")
const game_over_scene = preload("res://scenes/game_over_screen.tscn")

onready var player_sprite = $Sprite
onready var blaster_angle = $Node2D
onready var blaster_position = $Node2D/Position2D
onready var blaster_sprite = $Node2D/Position2D/Sprite

var gravity = Vector2.DOWN
var velocity = Vector2.ZERO

func _physics_process(_delta) -> void:
	handle_movement()
	handle_sprites()
	spawn_laser()

func _input(event) -> void:
	if event.is_action_pressed("ui_left"):
		gravity = Vector2.LEFT
	if event.is_action_pressed("ui_right"):
		gravity = Vector2.RIGHT
	if event.is_action_pressed("ui_down"):
		gravity = Vector2.DOWN
	if event.is_action_pressed("ui_up"):
		gravity = Vector2.UP
	self.rotation = -gravity.angle_to(Vector2.DOWN)

func _on_player_collider_body_entered(body) -> void:
	if body.is_in_group("enemy"):
		health -= 1
	
	if health <= 0:
		var game_over = game_over_scene.instance()
		get_parent().add_child(game_over)

func handle_movement() -> void:
	velocity += gravity * speed
	velocity = move_and_slide(velocity)
	
	if gravity.x == 0:
		velocity.x = lerp(velocity.x, 0, friction)
	if gravity.y == 0:
		velocity.y = lerp(velocity.y, 0, friction)

func spawn_laser() -> void:
	if Input.is_action_just_pressed("left_click"):
		var laser = laser_scene.instance()
		get_parent().add_child(laser)
		laser.position = blaster_position.global_position
		laser.rotation = blaster_angle.rotation
		laser.direction = get_global_mouse_position() - laser.position

func handle_sprites() -> void:
	blaster_angle.look_at(get_global_mouse_position())
	
	if blaster_angle.rotation_degrees > 180:
		blaster_angle.rotation_degrees -= 360
	if blaster_angle.rotation_degrees < -180:
		blaster_angle.rotation_degrees += 360
	
	if blaster_angle.rotation_degrees > 90 or blaster_angle.rotation_degrees < -90:
		player_sprite.flip_h = false
		blaster_sprite.flip_v = true
	else:
		player_sprite.flip_h = true
		blaster_sprite.flip_v = false
