extends KinematicBody2D

export(int) var speed = 10
export(float) var friction = 0.1

var gravity = Vector2.ZERO
var velocity = Vector2.ZERO

func _physics_process(_delta) -> void:
	handle_movement()

func _input(event) -> void:
	if event.is_action_pressed("ui_down"):
		gravity = Vector2.DOWN
	if event.is_action_pressed("ui_up"):
		gravity = Vector2.UP

func _on_vspike_collider_body_entered(body) -> void:
	if body.name != "tiles" and !body.is_in_group("enemy"):
		self.queue_free()

func handle_movement() -> void:
	velocity += gravity * speed
	velocity = move_and_slide(velocity)
	
	if gravity.x == 0:
		velocity.x = lerp(velocity.x, 0, friction)
	if gravity.y == 0:
		velocity.y = lerp(velocity.y, 0, friction)
