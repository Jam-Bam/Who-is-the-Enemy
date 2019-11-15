extends KinematicBody2D

const SPEED = 85
var movedir = Vector2(0,0)
var lastmotion
var canAsk = false
var currentNPC
var motion
var parent
var guts_resource = preload("res://misc/guts.tscn")

func _ready():
	parent = get_parent()

func _physics_process(delta):
	controls_loop()
	movement_loop()
	if Input.is_action_just_pressed("stab"):
		if currentNPC != null:
			var deadNPC = parent.get_child(currentNPC)
			var guts = guts_resource.instance()
			guts.position = deadNPC.position - Vector2(0,-8)
			parent.add_child(guts)
			parent.player.pitch_scale += 0.012
			deadNPC.queue_free()
			parent.population -= 1
			parent.honor_points -= 10
		match lastmotion:
			"d":
				$Sprite.play("stabd")
			"l":
				$Sprite.play("stabs")
			"r":
				$Sprite.play("stabs")
				$Sprite.flip_h
			"u":
				$Sprite.play("stabu")
		

func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)

func movement_loop():
	motion = movedir.normalized() * SPEED
	
	move_and_slide(motion, Vector2(0,0))
	if motion.x < 0:
		$Sprite.play("walks")
		$Sprite.flip_h = false
		lastmotion = "l"
	elif motion.x > 0:
		$Sprite.play("walks")
		$Sprite.flip_h = true
		lastmotion = "r"
	elif motion.y > 0:
		$Sprite.play("walkd")
		$Sprite.flip_h = false
		lastmotion = "d"
	elif motion.y < 0:
		$Sprite.play("walku")
		$Sprite.flip_h = false
		lastmotion = "u"
	else:
		if lastmotion == "d":
			$Sprite.play("idled")
		elif lastmotion == "u":
			$Sprite.play("idleu")
		elif lastmotion == "l":
			$Sprite.play("idles")
			$Sprite.flip_h = false
		elif lastmotion == "r":
			$Sprite.play("idles")
			$Sprite.flip_h = true

func _on_NPCdetection_body_entered(body):
	if body.is_in_group("NPC"):
		currentNPC = body.get_index()
		canAsk = true

func _on_NPCdetection_body_exited(body):
	if body.is_in_group("NPC"):
		currentNPC = null
		canAsk = false