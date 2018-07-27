extends KinematicBody


var gravity = -9.8
var velocity = Vector3()
var camera
var character 

const SPEED = 6
const ACCELL = 3
const DECELL = 5


onready var anim = get_node("AnimationPlayer")

func _ready():
	character = get_node(".")
	pass
	
func _physics_process(delta):
	var direction = Vector3()
	camera = get_node("Body/Camera").get_global_transform()
	var is_moving = false
	if Input.is_action_pressed("ui_up"):
		direction -= camera.basis[2]
		is_moving = true
		if (anim.is_playing()!=true):
			anim.play("Walking")
	if Input.is_action_pressed("ui_down"):
		direction += camera.basis[2]
		is_moving = true
		if (anim.is_playing()!=true):
			anim.play("Walking")
	if Input.is_action_pressed("ui_left"):
		
		direction -= camera.basis[0]
#			rotate_y(deg2rad(35*delta))
		is_moving = true
		if (anim.is_playing()!=true):
			anim.play("Walking")
	if Input.is_action_pressed("ui_right"):
#		if Input.is_action_pressed("ui_page_down"):
#			rotate_y(deg2rad(-60*delta))
#		else:
		direction += camera.basis[0]
		is_moving = true
#			rotate_y(deg2rad(-35*delta))
		if (anim.is_playing()!=true):
			anim.play("Walking")
	
	direction.y = 0
	direction = direction.normalized()
	  
	velocity.y += gravity* delta 

	
	var hv = velocity
	hv.y = 0
	
	var new_pos = direction * SPEED
	var accel = DECELL
	
	if (direction.dot(hv) >0):
		accel=ACCELL
	hv = hv.linear_interpolate(new_pos,accel*delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var char_rot = character.get_rotation()
		char_rot.y = angle
		character.set_rotation(char_rot)
		
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y =10
		
	var hitCount = get_slide_count()
	if (hitCount>0):
		var collision = get_slide_collision(0)
		if collision.collider is RigidBody:
			collision.collider.apply_impulse(collision.position, -collision.normal)