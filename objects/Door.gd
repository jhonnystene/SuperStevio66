extends Node2D

func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		var file_name = get_tree().current_scene.filename;
		file_name = file_name.replace("res://levels/level", "")
		file_name = file_name.replace(".tscn", "")
		var level_no = int(file_name) + 1
		Global.max_level = level_no
		Global.switch_to("res://levels/level" + str(level_no) + ".tscn")
