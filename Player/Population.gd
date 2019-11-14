extends Label

var score = 100


func _on_Label_ready():
	self.text = "Population: " + str(score)


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("PopulationSubtract"):
				if Input.is_key_pressed(KEY_E):
					if score != 0 and self.text != "Extinct":
						score = score - 1
						self.text = "Population:" + str(score)
						if score == 0:
							self.text = "Extinct"