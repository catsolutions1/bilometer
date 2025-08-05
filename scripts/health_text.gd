extends Label

onready var player = get_parent().get_parent().get_node("player")

func _process(_delta) -> void:
	self.text = "health: " + str(player.health)
