extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Panel.hide()
	pass

func _process(delta):
	rotate_x(deg2rad(30*delta))


func _on_Portal_body_entered(body):
	var i = 0
	if body is KinematicBody:
		$Panel.show()
		get_tree().paused = true

		
