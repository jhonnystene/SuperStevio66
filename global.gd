extends Node

var stevens = 0
var stevens_thislevel = 0

var timer = 0

var max_level = 1
var instruments_collected = []
var instrument_just_collected = null

var game_running = false

func reset_world():
	stevens -= stevens_thislevel
	stevens_thislevel = 0
	instrument_just_collected = null
	get_tree().change_scene(get_tree().current_scene.filename)

func switch_to(level):
	game_running = true
	stevens_thislevel = 0
	if(instrument_just_collected != null):
		instruments_collected.append(instrument_just_collected)
	save_game()
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

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)

	var save_data = {}
	save_data["timer"] = timer
	save_data["stevens"] = stevens
	save_data["max_level"] = max_level
	save_data["instruments_collected"] = instruments_collected
	save_game.store_line(to_json(save_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return

	save_game.open("user://savegame.save", File.READ)
	var save_data = parse_json(save_game.get_line())
	timer = save_data["timer"]
	stevens = save_data["stevens"]
	max_level = save_data["max_level"]
	instruments_collected = save_data["instruments_collected"]
	save_game.close()

func _ready():
	load_game()
