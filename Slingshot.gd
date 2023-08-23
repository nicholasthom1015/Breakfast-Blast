extends Node2D

enum SlingState{
	idle,
	pulling,
	Thrown,
	reset
}


var SlingshotState
var LeftLine
var RightLine
var CenterofSlingshot
var Player
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	SlingshotState = SlingState.idle
	LeftLine = $LeftLine
	RightLine = $RightLine
	CenterofSlingshot = $CenterofSlingshot.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match SlingshotState:
		SlingState.idle:
			pass
		SlingState.pulling:
			var player = get_tree().get_nodes_in_group("Player")[0]
			if Input.is_action_pressed("Left_mouse"):
				var mousepos = get_global_mouse_position()
				print(get_global_mouse_position())
				if mousepos.distance_to(CenterofSlingshot) > 275:
					mousepos = (mousepos - CenterofSlingshot).normalized() * 275 + CenterofSlingshot
				player.position = mousepos
				LeftLine.points[1] = mousepos
				RightLine.points[1] = mousepos
			else:
				var location = get_global_mouse_position()
				var mousepos = location.distance_to(CenterofSlingshot)
				var velocity = CenterofSlingshot - location
				
				player.Thrown()
				player = player as RigidBody2D
				player.apply_impulse(Vector2(), velocity)
				
				GameManager.CurrentGameState = GameManager.GameState.Playing
		SlingState.Thrown:
			pass
		SlingState.reset:
			pass
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if SlingshotState == SlingState.idle:
		if(event is InputEventMouseButton && event.pressed):
			SlingshotState = SlingState.pulling
	pass # Replace with function body.
