extends Node2D

var instrumentIcons = {}

func _ready():
	instrumentIcons["level5.tscn"] = load("res://sprites/entities/flute.png")
	instrumentIcons["level6.tscn"] = load("res://sprites/entities/saxophone.png")
	instrumentIcons["level7.tscn"] = load("res://sprites/entities/piano.png")
	instrumentIcons["level8.tscn"] = load("res://sprites/entities/recorder.png")
	
	var file_name = get_tree().current_scene.filename;
	file_name = file_name.replace("res://levels/", "")
	if file_name in Global.instruments_collected:
		queue_free()
	else:
		$spr_key.texture = instrumentIcons[file_name]

func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		var file_name = get_tree().current_scene.filename;
		file_name = file_name.replace("res://levels/", "")
		Global.instrument_just_collected = file_name
		queue_free()
