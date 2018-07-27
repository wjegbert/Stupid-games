extends Camera

# class member variables go here, for example:
export var distance = 10.0
export var height = 4.0
var prev = Transform()

func _ready():
	set_physics_process(true)
	set_as_toplevel(true)
	prev = get_parent().get_global_transform().origin

func _physics_process(delta):
	var target = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin
	var up = Vector3(0,1,0)
	var offset = pos - target
	offset = offset.normalized() *distance
	offset.y = height
	
	pos = target + offset
	look_at_from_position(pos, target, up)
	prev = target