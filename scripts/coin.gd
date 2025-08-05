extends StaticBody2D

func _on_coin_collider_body_entered(body) -> void:
	if !body.is_in_group("coin"):
		self.queue_free()
