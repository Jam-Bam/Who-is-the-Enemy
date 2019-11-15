extends KinematicBody2D

const SPEED = 40
var movedir = Vector2(0,0)
var movetimer_length = int(rand_range(100, 300))
var movetimer = 0
var anim = 0
func _ready():
	anim = int(rand_range(0,19))
	
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	
	$AnimatedSprite.play(String(anim))
	
func _physics_process(delta):
	if movedir != Vector2(0,0):
		if $AnimatedSprite.frame == 2:
			$AnimatedSprite.frame = 0
	movement_loop()
	if movetimer > 0:
		movetimer -= 1
	if movedir == Vector2(0,0):
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 2
	else:
		$AnimatedSprite.play()
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length