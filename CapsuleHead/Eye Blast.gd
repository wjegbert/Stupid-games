extends Spatial

var vel = -20

var direction = Vector3()
var timeout = 5
var timer = 0 
var forwards =Vector3()
func _ready():
	forwards = global_transform.basis.z.normalized()
	$Area.connect("body_entered",self, "collided")
	pass

func _physics_process(delta):
#	var forwards = global_transform.basis.z.normalized()
	global_translate(forwards*vel*delta)
	
	timer += delta
	if timer>timeout:
		queue_free()
		
func collided(body):
	if body is RigidBody:
		body.apply_impulse(get_translation(), global_transform.basis.z.normalized())		
		queue_free()
	if body is StaticBody:
		queue_free()
	if body is KinematicBody:
		body.translate_object_local(Vector3(10,10,10))
		queue_free()