extends Container

func _ready():
	var files = []
	var dir = Directory.new()
	dir.open("res://levels")
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			if not file == "level_template.tscn":
				files.append(file)

	dir.list_dir_end()
	
	# Sort levels in natural order
	var levels = []
	levels.resize(len(files))
	for file in files:
		file = file.replace("level", "").replace(".tscn", "")
		levels[int(file) - 1] = "level" + str(file) + "_tscn"
	
	var levelselector = load("res://objects/LevelSelectorDoor.tscn")
	for leveli in range(0, len(levels)):
		if(leveli > Global.max_level - 1):
			break
		var instance = levelselector.instance()
		instance.name = levels[leveli]
		instance.global_position = Vector2(336 + (leveli * 128), 592)
		$LevelSelector.add_child(instance)
	
