extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_Spike_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.position = $"../Position2D".position
