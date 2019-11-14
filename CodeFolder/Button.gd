extends Button

# Declare member variables here. Examples:
var score = 100
# var b = "text"

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button_pressed():
	if score != 0 &&! self.text == "Extinct":
		score = score - 1
		self.text = "Population:" + str(score)
	if score == 0:
		self.text = "Extinct"

func _on_Button_ready():
	self.text = "Population:" + str(score)
