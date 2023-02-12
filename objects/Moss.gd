extends Node2D

func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		body.grabbing_moss += 1
		body.velocity.y = 0 

func _on_Area2D_body_exited(body):
	if("Marlio" in body.name):
		body.grabbing_moss -= 1
