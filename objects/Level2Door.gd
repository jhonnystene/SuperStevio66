extends Node2D

func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		Global.switch_to("res://levels/level3.tscn")
