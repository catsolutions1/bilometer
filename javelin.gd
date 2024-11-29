#https://www.youtube.com/watch?app=desktop&v=eaDQtCvi6c0
extends KinematicBody2D

var navagent: NavigationAgent2D

func _ready():
	navagent = $NavigationAgent2D
	navagent.connect("velocity_computed", self, "_on_velocity_computed")

func _physics_process(_delta):
	if navagent.is_navigation_finished():
		return
	var targetpos = navagent.get_next_location()
	var direction = global_position.direction_to(targetpos)
	var velocity = direction * navagent.max_speed
	navagent.set_velocity(velocity)

func _on_velocity_computed(velocity):
	velocity = move_and_slide(velocity)
	

func _on_Timer_timeout():
	navagent.set_target_location(get_parent().get_node("player").global_position)
	self.look_at(get_parent().get_node("player").global_position)
