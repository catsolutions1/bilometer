extends Node2D

export var health = 20

signal level_clear

const javelin_scene = preload("res://scenes/javelin.tscn")
const laser_scene = preload("res://scenes/laser.tscn")

onready var blaster_angle = $Node2D
onready var blaster_position = $Node2D/Position2D
onready var player = get_parent().get_parent().get_node("player")

var tracking_distance = 1200

func _physics_process(_delta) -> void:
	blaster_angle.look_at(player.position)

func _on_Timer_timeout() -> void:
	spawn_javelin()
	spawn_laser()

func _on_boss_collider_body_entered(body) -> void:
	if !body.is_in_group("enemy"):
		health -= 1
	if health <= 0:
		emit_signal("level_clear")

func spawn_javelin() -> void:
	if self.global_position.x - player.global_position.x <= tracking_distance:
		var javelin = javelin_scene.instance()
		get_parent().add_child(javelin)
		javelin.global_position = blaster_position.global_position
		javelin.rotation = blaster_angle.rotation
		javelin.tracking_distance = 1200
		javelin.add_to_group("enemy")

func spawn_laser() -> void:
	var laser = laser_scene.instance()
	get_parent().get_parent().add_child(laser)
	laser.position = blaster_position.global_position
	laser.rotation = blaster_angle.rotation
	laser.direction = player.position - laser.position
	laser.add_to_group("enemy")
