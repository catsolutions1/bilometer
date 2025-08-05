#https://www.youtube.com/watch?app=desktop&v=eaDQtCvi6c0
extends KinematicBody2D

onready var navagent = $NavigationAgent2D
onready var player = get_parent().get_node("../player")

var tracking_distance = 800

func _ready() -> void:
	navagent.connect("velocity_computed", self, "_on_velocity_computed")

func _physics_process(_delta) -> void:
	if navagent.is_navigation_finished():
		return
	var targetpos = navagent.get_next_location()
	var direction = global_position.direction_to(targetpos)
	var velocity = direction * navagent.max_speed
	if self.global_position.x - player.global_position.x > tracking_distance:
		velocity = Vector2.ZERO
	navagent.set_velocity(velocity)

func _on_velocity_computed(velocity) -> void:
	velocity = move_and_slide(velocity)

func _on_Timer_timeout() -> void:
	navagent.set_target_location(player.global_position)
	self.look_at(player.global_position)

func _on_javelin_collider_body_entered(body) -> void:
	if !body.is_in_group("enemy") and !body.name == "tiles":
		self.queue_free()
