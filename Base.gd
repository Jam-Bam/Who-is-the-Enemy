extends Node

var NPC_Resource = load("res://NPCs/NPC.tscn")
onready var pop_label = $CanvasLayer/popLabel
onready var hon_label = $CanvasLayer/honLabel
var population = 50
var honor_points = 0

func _ready():
	for i in range(population):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = Vector2(350,50)

func _process(delta):
	pop_label.text = "Population: " + String(population)
	hon_label.text = "Points: " + String(honor_points)