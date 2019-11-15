extends Node2D



onready var court = $AnimatedSprite
onready var stringPrinted = "Mr. Schitz, do you have anything to say for yourself?"

func _ready():
	$Timer.set_wait_time(.1) # time between letters
	_dialogue(stringPrinted)
	
	

func _dialogue(string):
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
	$Timer2.start()

func _dialogue2(string):
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
	$Timer3.start()

func _dialogue3(string):
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
	$Timer4.start()




func _on_Timer2_timeout():
	$RichTextLabel.text = ""
	$AnimatedSprite.frame = 1
	var sp = "The guy on the radio told me to do it!"
	_dialogue2(sp)

func _on_Timer3_timeout():
	$RichTextLabel.text = ""
	$AnimatedSprite.frame = 2
	var sp = "When we found you, the radio didn;t have any batteries..."
	_dialogue3(sp)


func _on_Timer4_timeout():
	$RichTextLabel.text = ""
	$AnimatedSprite.frame = 1
	var sp = "You wouldn't understand..."
	$Timer5.start()


func _on_Timer5_timeout():
	get_tree().quit()
