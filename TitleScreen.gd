extends Control


func _on_PlayBtn_pressed():
	get_tree().change_scene("res://Base.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
