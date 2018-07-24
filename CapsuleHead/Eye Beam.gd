extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


#func _on_Forcefield_body_entered(body):
#	print("called")
#	if body is KinematicBody:
#		body.translate(Vector3(0,0,100))
#	#		if body is RigidBody:
##		body.apply_impulse(body.get_global_position(), 100)


func _on_Forcefield_body_entered(body):
	print("called")
#	if body is KinematicBody:
#		body.translate(Vector3(0,0,100))
	#		if body is RigidBody:
#		body.apply_impulse(body.get_global_position(), 100)
