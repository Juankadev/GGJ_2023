extends Area2D

var agarrado=false
var player

func _physics_process(delta):
	if agarrado:
		self.position=player.position

func _on_Gema_body_entered(body):
	if body.get_name()=="Player":
		agarrado=true
		player=body
