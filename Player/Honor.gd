extends Label

var score = 1000


func _on_Label_ready():
	self.text = "Honor: " + str(score)


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("HonorSubtract"):
				if Input.is_key_pressed(KEY_R):
					if score != 0 and self.text != "Untrusted":
						score = score - 100
						self.text = "Honor:" + str(score)
						if score == 0:
							self.text = "Untrusted"
