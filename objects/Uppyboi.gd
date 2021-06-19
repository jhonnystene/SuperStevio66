extends Node2D

const HEIGHT = -500

func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		body.velocity.y = HEIGHT
		$AudioStreamPlayer2D.play()
