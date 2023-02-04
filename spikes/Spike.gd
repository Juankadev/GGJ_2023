extends Area2D

func _on_Spike_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.position = $"../../Position2D".position
		
	if body.is_in_group("box"):
		body.position = Vector2.ZERO
