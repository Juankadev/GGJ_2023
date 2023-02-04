extends Node2D


func _on_CheckPointFirst_body_entered(body: Node) -> void:
	$"../Position2D".position = $CheckPointFirst.position


func _on_CheckPointTwo_body_entered(body: Node) -> void:
	$"../Position2D".position = $CheckPointTwo.position
