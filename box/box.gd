extends KinematicBody2D

const speed: float = 250.0
const maxSpeed: float = 300.0
const jump_power: float = -400.0
const gravity: float = 15.0 	

var motion = Vector2()

var is_being_pushed = false
var body_push_direction = 0

func _physics_process(delta: float) -> void:
	var friction = false
	
	if !is_on_floor():
		motion.y += gravity;

	if is_being_pushed:
		var direction: Vector2 = Vector2.ZERO
		if body_push_direction == 1:
			motion.x = min(motion.x + speed, maxSpeed)
		elif body_push_direction == -1:
			motion.x = max(motion.x - speed, -maxSpeed)
	else:
		friction = true
		body_push_direction = 0

	if friction == true:
		motion.x = lerp(motion.x, 0, 0.5)
	
	motion = move_and_slide(motion, Vector2.UP)
	
func _on_PushDetector_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		is_being_pushed = true
		var dir_debug_string = ""
		if body.global_position.x > global_position.x:
			body_push_direction = -1
			dir_debug_string = "left"
		else:
			body_push_direction = 1
			dir_debug_string = "right"
			
		print("player is pushing box to the " + dir_debug_string)

func _on_PushDetector_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		body_push_direction = 0
		is_being_pushed = false
		print("player stopped pushing box")
