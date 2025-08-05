extends StaticBody2D

onready var room_contents = get_room_nodes()
var enemy_count: int = 0

func _physics_process(_delta) -> void:
	room_contents = get_room_nodes()
	for i in room_contents:
		if i.is_in_group("enemy") or i.is_in_group("coin"):
			enemy_count += 1
	if enemy_count == 0:
		self.queue_free()
	enemy_count = 0

func get_room_nodes() -> Array:
	var children = get_parent().get_children()
	return children
