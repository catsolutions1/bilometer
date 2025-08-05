extends Node2D

#number of rooms not including start and end rooms
export var room_count: int = 8

const room_start = preload("res://scenes/rooms/room_start.tscn")
const room_empty = preload("res://scenes/rooms/room_empty.tscn")
const room_maze = preload("res://scenes/rooms/room_maze.tscn")
const room_maze2 = preload("res://scenes/rooms/room_maze2.tscn")
const room_antechamber = preload("res://scenes/rooms/room_antechamber.tscn")
const room_antechamber2 = preload("res://scenes/rooms/room_antechamber2.tscn")
const room_bucket = preload("res://scenes/rooms/room_bucket.tscn")
const room_bucket2 = preload("res://scenes/rooms/room_bucket2.tscn")
const room_walls = preload("res://scenes/rooms/room_walls.tscn")
const room_walls2 = preload("res://scenes/rooms/room_walls2.tscn")
const room_diagonal = preload("res://scenes/rooms/room_diagonal.tscn")
const room_diagonal2 = preload("res://scenes/rooms/room_diagonal2.tscn")
const room_end = preload("res://scenes/rooms/room_end.tscn")

const win_scene = preload("res://scenes/win_screen.tscn")

onready var player = get_node("player")

var room_list = [room_empty, room_antechamber, room_antechamber2, room_maze, room_maze2, room_bucket, room_bucket2, room_walls, room_walls2, room_diagonal, room_diagonal2]

func _ready() -> void:
	randomize()
	generate_level()

func _on_boss_level_clear() -> void:
	get_tree().call_group("room", "queue_free")
	yield(get_tree(), "idle_frame")
	generate_level()

func generate_level() -> void:
	var start_room = room_start.instance()
	start_room.global_position = Vector2.ZERO
	add_child(start_room)
	
	for i in room_count:
		var room = room_list[randi() % room_list.size()].instance()
		room.global_position = Vector2(1600 + i*1600, 0)
		add_child(room)
	
	var end_room = room_end.instance()
	end_room.global_position = Vector2(1600 + room_count*1600, 0)
	add_child(end_room)
	
	var boss = get_node("room_end/boss")
	boss.connect("level_clear", self, "_on_boss_level_clear")
	
	player.global_position = Vector2(800, 440)
	player.gravity = Vector2.DOWN
	player.velocity = Vector2.ZERO
