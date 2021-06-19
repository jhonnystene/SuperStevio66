extends Node2D

const HEIGHT = -200

func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		body.velocity.y = HEIGHT
		body.global_position.y -= 15
		body.parachuting = true
		body.parachute_just_started = true
		$AudioStreamPlayer2D.play()
