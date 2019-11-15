extends Node2D



onready var court = $AnimatedSprite
onready var stringPrinted = "Mr. Schitz, do you have anything to say for yourself?"

func _ready():
	$Timer.set_wait_time(.1) # time between letters
	_dialogue(stringPrinted)
	
	

func _dialogue(string):
	$Timer2.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
	

func _dialogue2(string):
	$Timer3.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
	

func _dialogue3(string):
	$Timer4.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
	
func _dialogue4(string):
	$Timer5.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")



func _on_Timer2_timeout():
	$RichTextLabel.text = ""
	$AnimatedSprite.frame = 1
	var sp = "The guy on the radio told me to do it!"
	_dialogue2(sp)

func _on_Timer3_timeout():
	$RichTextLabel.text = ""
	$AnimatedSprite.frame = 2
	var sp2 = "When we found you, the radio didn;t have any batteries..."
	_dialogue3(sp2)


func _on_Timer4_timeout():
	$RichTextLabel.text = ""
	$AnimatedSprite.frame = 1
	var sp3 = "You wouldn't understand..."
	_dialogue4(sp3)


func _on_Timer5_timeout():
	get_tree().quit()
