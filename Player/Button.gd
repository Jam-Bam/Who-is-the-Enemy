extends Button

var score = 100

func _on_Button_pressed():
	if score != 0 &&! self.text == "Extinct":
		score = score - 1
		self.text = "Population:" + str(score)
	if score == 0:
		self.text = "Extinct"

func _on_Button_ready():
	self.text = "Population:" + str(score)