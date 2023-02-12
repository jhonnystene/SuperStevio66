extends CanvasLayer

func _process(_delta):
	$PauseMenu/Background/Foreground/StevensCollected.text = str(Global.stevens)
	$PauseMenu/Background/Foreground/TimePlaying.text = "Time: " + str(Global.get_time())
	$Control.rect_size = get_viewport().size;
	
	if(Input.is_action_just_pressed("ui_pause")):
		get_tree().paused = true
