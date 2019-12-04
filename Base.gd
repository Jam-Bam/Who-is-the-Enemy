extends Node
var beginning_text = "Hey Schiz, it's me! Listen! There's someone out to get you! Your only chance is to get rid of them before they kill you! TRUST ME! My sources say they have a white shirt on. By the way, you can move with WASD or the ARROWS and stab your target with the SPACEBAR. Good luck!"
var text_array = ["Whoops, I was wrong, they're wearing a blue shirt!", 
"Oh no! I forgot to mention they have green hair.", 
"Oh wait! Find the man with the glasses now!", 
"They might be wearing a tie!", 
"I bet they don't have any hair.", 
"I don't really like their fashion sense.", 
"Keep on eye on that one.", 
"The strong ones could easily strangle you.", 
"Their head is a bit oddly shaped.", 
"I think it's a woman!", 
"What do you say we grab a drink once's everything's cleared up?", 
"Make sure your knife doesn't get too dull."]
var end_text = "SCHIZ!!! I can't help you anymore! Trust no one but yourself!"
var NPC_Resource = load("res://NPCs/NPC.tscn")
var used_texts = [-1, -2]
onready var player = $MusicPlayer
onready var siren = $Siren
onready var timer = $Timer
onready var pop_label = $UI/popLabel
onready var hon_label = $UI/honLabel
onready var top_left = $Points/TopLeft
onready var top_right = $Points/TopRight
onready var bottom_left = $Points/BottomLeft
onready var bottom_right = $Points/BottomRight
var population = 40
var honor_points = 0
var endgame = false
var x = true
var newd = null
var used = false
var ahhhh = false

func _ready():
	$Player.get_tree().paused = true
	timer.set_wait_time(.03)
	_dialogue(beginning_text)
	player.play()
	randomize()
	for i in range(10):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = top_left.position
	for i in range(10):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = top_right.position
	for i in range(10):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = bottom_left.position
	for i in range(10):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = bottom_right.position

func _dialogue(string):
	
	player.volume_db = -10
	$RadioGuy.play()
	for letter in string:
		timer.start()
		$UI/RadioText.add_text(letter)
		yield(timer, "timeout")
		#if $UI/RadioText.text == beginning_text:
			
		if $UI/RadioText.text == string:
			$RadioGuy.stop()
			for i in range(180):
				yield(get_tree(), "idle_frame")
			$UI/RadioText.text = ""
			player.volume_db = 0
			$Player.get_tree().paused = false
			for i in range(1800):
				yield(get_tree(), "idle_frame")
			newdialog()
			


func newdialog():
	if not endgame:
		while x == true:
			newd = randi() % 11
			if used_texts.count(newd) == 0:
				print("Unique phrase!")
				used_texts.append(newd)
				print(used_texts)
				break
				
			else:
				print("Has been said...")
				
		_dialogue(text_array[newd])

func _process(delta):
	pop_label.text = "Population: " + String(population)
	hon_label.text = "Points: " + String(honor_points)
	$UI/Clock.text = String(int($InternalClock.time_left))
	if $UI/Clock.text == String(30) and not endgame:
		endgame = true
		_dialogue(end_text)
	if population == 0 and not ahhhh:
		ahhhh = true
		_on_InternalClock_timeout()

func _on_InternalClock_timeout():
	if population == 40:
		get_tree().change_scene("res://WonGame.tscn")
	else:
		player.stop()
		siren.play()
		for i in range(210):
				yield(get_tree(), "idle_frame")
		siren.stop()
		get_tree().change_scene("res://Court.tscn")