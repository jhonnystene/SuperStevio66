extends Node2D

var selected = false

func _process(delta):
	if(Input.is_action_just_pressed("ui_accept") and selected):
		Global.delete_save()
		Global.reset_world()

func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		selected = true

func _on_Area2D_body_exited(body):
	if("Marlio" in body.name):
		selected = false
