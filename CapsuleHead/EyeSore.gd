extends Spatial


onready var blast = preload("res://Eye Blast.tscn")
var vel = Vector3(20,20,20)
var dir = Vector3()
var instancecheck = false
var beam
func _ready():
#	$"MeshInstance/EyeInset/Eye/Eye Beam".hide()
##	$"MeshInstance/EyeInset/Eye/Eye Beam/Area".scale
#	scaleset = $"MeshInstance/EyeInset/Eye/Eye Beam".get_scale()
#	$"MeshInstance/EyeInset/Eye/Eye Beam".set_scale(Vector3(0.01,0.01,0.01))
	pass
func _physics_process(delta):
	
#		print($MeshInstance/EyeInset/Eye/RayCast.get_collider())
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass


func _on_Cooldown_timeout():
	
	if $MeshInstance/EyeInset/Eye/RayCast.is_colliding():
		if $MeshInstance/EyeInset/Eye/RayCast.get_collider() is KinematicBody:
			beam = blast.instance()
			get_node("MeshInstance/EyeInset/Eye").add_child(beam)
		else:
			pass
#		var path = $MeshInstance/EyeInset/Eye/RayCast.get_cast_to()
#		dir = $MeshInstance/EyeInset/Eye.translation.linear_interpolate(path, 100)
#		print(-dir)
#		vel = vel *-dir 
		
#		instancecheck = true
	
#	if !($"MeshInstance/EyeInset/Eye/Eye Beam".visible):
#		if $MeshInstance/EyeInset/Eye/RayCast.get_collider() is KinematicBody:
#			$"MeshInstance/EyeInset/Eye/Eye Beam".show()
#			$"MeshInstance/EyeInset/Eye/Eye Beam".set_scale(scaleset)
#
#	else:
#			$"MeshInstance/EyeInset/Eye/Eye Beam".hide()
#			$"MeshInstance/EyeInset/Eye/Eye Beam".set_scale(Vector3(0.01,0.01,0.01))
#
#	if $"MeshInstance/EyeInset/Eye/Eye Beam".visible