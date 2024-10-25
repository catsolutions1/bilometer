extends Area2D

export(int) var tile_size: int = 64
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}
onready var ray = $RayCast2D

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _unhandled_input(event):
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(direction)

func move(direction):
	ray.cast_to = inputs[direction] * (tile_size / 8 + 1)
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[direction] * tile_size
