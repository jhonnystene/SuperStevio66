extends Node2D

func _process(delta):
	$spr_stevenface.rotation_degrees += 30 * delta


func _on_Area2D_body_entered(body):
	if("Marlio" in body.name):
		body.addSteven()
		queue_free()
