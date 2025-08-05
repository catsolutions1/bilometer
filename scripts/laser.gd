extends KinematicBody2D

const speed = 800
const max_time = 1.0

var direction: Vector2
var collision: KinematicCollision2D

func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = max_time
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func on_timeout() -> void:
	self.queue_free()

func _physics_process(delta) -> void:
	collision = move_and_collide(direction.normalized() * delta * speed)
