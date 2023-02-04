extends KinematicBody2D

const speed: float = 250.0
const maxSpeed: float = 300.0
const jump_power: float = -500.0
const gravity: float = 15.0 	

var motion = Vector2()

func _physics_process(delta: float) -> void:
	motion.y += gravity;
	
	var friction = false
	
	var direction: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		motion.x = min(motion.x + speed, maxSpeed)
	elif Input.is_action_pressed("move_left"):
		motion.x = max(motion.x - speed, -maxSpeed)
	else:
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = jump_power
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	
	motion = move_and_slide(motion, Vector2.UP)
