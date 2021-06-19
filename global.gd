extends Node

var stevens = 0
var stevens_thislevel = 0

var timer = 0

var game_running = false

func reset_world():
	stevens -= stevens_thislevel
	stevens_thislevel = 0
	get_tree().change_scene(get_tree().current_scene.filename)

func switch_to(level):
	game_running = true
	stevens_thislevel = 0
	get_tree().change_scene(level)

func reset():
	stevens = 0
	stevens_thislevel = 0
	timer = 0
	get_tree().change_scene("res://levels/level1.tscn")

func add_steven():
	stevens += 1
	stevens_thislevel += 1

func _process(delta):
	if(game_running):
		timer += delta
		
func get_time():
	var seconds = int(timer) % 60
	if(seconds < 10):
		seconds = "0" + str(seconds)
	else:
		seconds = str(seconds)
		
	var minutes = floor(timer / 60)
	if(minutes < 10):
		minutes = "0" + str(minutes)
	else:
		minutes = str(minutes)
	var time = minutes + ":" + seconds
	return time
