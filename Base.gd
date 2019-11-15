extends Node

var NPC_Resource = load("res://NPCs/NPC.tscn")

func _ready():
	for i in range(100):
		var NPC = NPC_Resource.instance()
		add_child(NPC)
		NPC.position = Vector2(350,50)
		#NPC (AnimatedSprite1).play(rand_range(1, 10))
		