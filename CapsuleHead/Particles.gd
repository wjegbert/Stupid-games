extends Particles

onready var thing = ParticlesMaterial.emission_shape(2)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	thing.x +=1
	thing.z +=1
	
