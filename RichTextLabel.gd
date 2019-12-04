extends Node2D

onready var court = $AnimatedSprite
onready var sp = ["Mr. Schitz, do you have anything to say for yourself?", "The guy on the radio told me to do it!", "When we found you, the radio didn't have any batteries...", "You wouldn't understand..."] 

func _ready():
	$Timer.set_wait_time(.1) # time between letters
	_dialogue(sp[0])

func _dialogue(string):
	#$Timer2.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
		
		if $RichTextLabel.text == sp[0]:
			for i in range(120):
				yield(get_tree(), "idle_frame")
			$RichTextLabel.text = ""
			$AnimatedSprite.frame = 1
			_dialogue2(sp[1])

func _dialogue2(string):
	#$Timer3.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
		
		if $RichTextLabel.text == sp[1]:
			for i in range(120):
				yield(get_tree(), "idle_frame")
			$RichTextLabel.text = ""
			$AnimatedSprite.frame = 2
			_dialogue3(sp[2])

func _dialogue3(string):
	#$Timer4.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
		
		if $RichTextLabel.text == sp[2]:
			for i in range(120):
				yield(get_tree(), "idle_frame")
			$RichTextLabel.text = ""
			$AnimatedSprite.frame = 1
			_dialogue4(sp[3])
	
func _dialogue4(string):
	#$Timer5.start()
	for letter in string:
		$Timer.start()
		$RichTextLabel.add_text(letter)
		yield($Timer, "timeout")
		
		if $RichTextLabel.text == sp[3]:
			for i in range(120):
				yield(get_tree(), "idle_frame")
			get_tree().quit()