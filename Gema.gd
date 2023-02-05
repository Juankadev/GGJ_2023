extends Area2D

var agarrado=false
var player
onready var gema

func _physics_process(delta):
	gema = get_parent().get_parent().get_node("Player/posGema").global_position
	if agarrado:
		#var newpos = Vector2(player.position.x + 20, player.position.y - 40)
		self.position=gema

func _on_Gema_body_entered(body):
	if body.get_name()=="Player":
		agarrado=true
		player=body
		
