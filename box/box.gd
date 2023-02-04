extends KinematicBody2D

const speed: float = MovementGlobals.PLAYER_SPEED
const maxSpeed: float = MovementGlobals.MAX_SPEED
const jump_power: float = MovementGlobals.JUMP_POWER

var motion = Vector2()

var can_grab = false
# var body_push_direction = 0

onready var cached_player = $"../Player"

func _physics_process(delta: float) -> void:
	if false:
		
		if can_grab and Input.is_action_pressed("grab"):
			motion = cached_player.motion
			motion = move_and_slide(motion, Vector2.UP)
			print(cached_player.motion.x)

	if !is_on_floor():
		motion.y += MovementGlobals.GRAVITY;

	var friction = false
	
	var is_grabbing: bool = false
	if can_grab and Input.is_action_pressed("grab"):
		is_grabbing = true

	if is_grabbing:
		print("player is grabbing box")
		if Input.is_action_pressed("move_right"):
			motion.x = min(motion.x + speed, maxSpeed)
		elif Input.is_action_pressed("move_left"):
			motion.x = max(motion.x - speed, -maxSpeed)
	else:
		friction = true
#		body_push_direction = 0

	if friction == true:
		motion.x = lerp(motion.x, 0, 0.5)
	
	motion = move_and_slide(motion, Vector2.UP)
	
func _on_PushDetector_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		cached_player = body
		can_grab = true
#		if body.global_position.x > global_position.x:
#			body_push_direction = -1
#		else:
#			body_push_direction = 1
			
		print("player can grab box")

func _on_PushDetector_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
#		body_push_direction = 0
		can_grab = false
		print("player cannot grab box")
