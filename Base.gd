extends Node

var NPC_Resource = load("res://NPCs/NPC.tscn")
onready var pop_label = $UI/popLabel
onready var hon_label = $UI/honLabel
onready var top_left = $Points/TopLeft
onready var top_right = $Points/TopRight
onready var bottom_left = $Points/BottomLeft
onready var bottom_right = $Points/BottomRight
var population = 80
var honor_points = 0

func _ready():
<<<<<<< HEAD
	for i in range(20):
=======
	randomize()
	for i in range(10):
>>>>>>> 66d82cfe27787e719e15f9b574aaecaaad28f538
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = top_left.position
	for i in range(20):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = top_right.position
	for i in range(20):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = bottom_left.position
	for i in range(20):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = bottom_right.position

func _process(delta):
	pop_label.text = "Population: " + String(population)
	hon_label.text = "Points: " + String(honor_points)