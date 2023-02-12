extends Node2D

func _process(_delta):
	if(Global.game_running):
		if(!$AudioStreamPlayer.playing):
			$AudioStreamPlayer.playing = true
	else:
		$AudioStreamPlayer.playing = false
