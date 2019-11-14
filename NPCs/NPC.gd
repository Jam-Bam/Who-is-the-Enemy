extends KinematicBody2D

const SPEED = 40
var movedir = Vector2(0,0)
var movetimer_length = 100
var movetimer = 0

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	
func _physics_process(delta):
	movement_loop()
	if movetimer > 0:
		movetimer -= 1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length