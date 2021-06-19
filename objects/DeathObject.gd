extends Node2D

func _on_Area_body_entered(body):
	if("Marlio" in body.name):
		body.queue_free()
		$AudioStreamPlayer.play()
		
func _on_AudioStreamPlayer_finished():
	Global.reset_world()
