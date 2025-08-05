extends Camera2D

onready var window_size = Vector2(1600, 800)
onready var player = get_parent().get_node("player")

func _process(_delta) -> void:
	self.global_position = get_room_position(player)

func get_room_position(target) -> Vector2:
	var x = floor(target.global_position.x / window_size.x)
	var room_position = Vector2(window_size.x*x,0)
	return room_position
