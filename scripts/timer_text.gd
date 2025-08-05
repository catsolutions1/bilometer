extends Label

var time = 0

func _process(delta) -> void:
	time += delta
	self.text = "time: " + str(round(time))
