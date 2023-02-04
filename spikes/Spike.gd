extends Area2D

var player: Node = null

# TODO(beto): make timer work
func _on_Spike_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
#		player = body
		body.position = $"../../Position2D".position
#		$"../../Player".on_killed()
#		$"../../Timer".start()

	if body.is_in_group("box"):
		body.position = Vector2.ZERO
#
#func _on_Timer_timeout() -> void:
#	print("timer timed out")
#	if player:
#		$"../../Player".on_respawn()
#		player.position = $"../../Position2D".position
#
#	$"../../Timer".stop()
