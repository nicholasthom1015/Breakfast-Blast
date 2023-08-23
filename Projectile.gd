extends RigidBody2D

var mode


# Called when the node enters the scene tree for the first time.
func _ready():
	#mode = RigidBody2D.FREEZE_MODE_STATIC
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Thrown():
	mode = RigidBody2D.FREEZE_MODE_KINEMATIC
