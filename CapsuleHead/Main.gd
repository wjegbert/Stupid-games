extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_Z):
		get_tree().reload_current_scene()
		
	$EyeSore/MeshInstance/EyeInset/Eye.look_at($KinematicBody.translation, Vector3(0,1,0))
	


func _on_SpaceCube_body_entered(body):
	if body is RigidBody:
		body.queue_free()
		$Wedge.queue_free()


	
