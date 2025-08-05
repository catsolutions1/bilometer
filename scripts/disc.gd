extends StaticBody2D

const laser_scene = preload("res://scenes/laser.tscn")

onready var blaster_angle = $Node2D
onready var blaster_position = $Node2D/Position2D
onready var player = get_parent().get_parent().get_node("player")

func _physics_process(_delta) -> void:
	blaster_angle.look_at(player.position)

func _on_Timer_timeout() -> void:
	var laser = laser_scene.instance()
	get_parent().get_parent().add_child(laser)
	laser.position = blaster_position.global_position
	laser.rotation = blaster_angle.rotation
	laser.direction = player.position - laser.position
	laser.add_to_group("enemy")

func _on_disc_collider_body_entered(body) -> void:
	if !body.is_in_group("enemy"):
		self.queue_free()
