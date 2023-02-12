extends Control

func _process(_delta):
	if(get_tree().paused):
		show()
	else:
		hide()


func _on_QuitButton_pressed():
	get_tree().paused = false
	Global.game_running = false
	get_tree().change_scene("res://ui/TitleScreen.tscn")

func _on_ResumeButton_pressed():
	get_tree().paused = false
