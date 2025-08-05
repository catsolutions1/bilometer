extends Label

var floor_number: int = 1

func _ready() -> void:
	connect_boss()

func _process(_delta) -> void:
	self.text = "loop: " + str(floor_number)

func _on_boss_level_clear() -> void:
	connect_boss()
	floor_number += 1

func connect_boss() -> void:
	yield(get_tree(), "idle_frame")
	var boss = get_parent().get_parent().get_node("room_end/boss")
	boss.connect("level_clear", self, "_on_boss_level_clear")
