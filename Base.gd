extends Node
var beginning_text = "......... Schiz! It's me! Listen!!! They're out to get you!! You must kill them before they kill you! TRUST ME! Watch out, They have a white shirt on! By the way, you can move with WASD or the Arrow Keys and STAB with the SPACEBAR. Goodluck!"
var text_array = ["Whoops, I was wrong, they're wearing a blue shirt!","Oh no! I forgot to mention they have green hair","Oh wait! Find the man with the glasses now!"]
var end_text = "SCHIZ!!! I can't help you anymore! Trust no one but yourself!"
var NPC_Resource = load("res://NPCs/NPC.tscn")
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
var talking = false

func _ready():
	$Player.get_tree().paused = true
	timer.set_wait_time(.05)
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
		if $UI/RadioText.text == beginning_text or $UI/RadioText.text == text_array[0] or $UI/RadioText.text == text_array[1] or $UI/RadioText.text == text_array[2]:
			$Text_End.start()
			$RadioGuy.stop()
			player.volume_db = 0

func _process(delta):
	pop_label.text = "Population: " + String(population)
	hon_label.text = "Points: " + String(honor_points)
	if population == 0:
		if siren.playing != true:
			siren.play()
			player.stop()
			timer.start()
	if ($UI/Clock.text == String(240) or $UI/Clock.text == String(180)) or $UI/Clock.text == String(120) and talking == true:
		if talking:
			print("pie")
			talking = false
			_dialogue(text_array[int(rand_range(0,2))])
	if ($UI/Clock.text == String(60)) and talking:
		if talking:
			talking = false
			_dialogue(end_text)


func _on_Timer_timeout():
	get_tree().change_scene("res://Court.tscn")
	
func _on_Text_End_timeout():
	$UI/RadioText.text = ""
	$Player.get_tree().paused = false
	talking = true


func _on_InternalClock_timeout():
	if population == 40:
		get_tree().change_scene("res://WonGame.tscn")
	else:
		pass
