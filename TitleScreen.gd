extends Node2D

var anim_cycle = 0

var do_splash_fadeout = false

func _on_TextureButton_pressed():
	Global.switch_to("res://levels/level1.tscn")

func _on_Timer_timeout():
	if(anim_cycle == 0):
		$spr_stevenface.rotation_degrees = 45
		$spr_stevenface2.rotation_degrees = -45
		anim_cycle = 1
	else:
		$spr_stevenface.rotation_degrees = -45
		$spr_stevenface2.rotation_degrees = 45
		anim_cycle = 0


func _on_Timer2_timeout():
	do_splash_fadeout = true

func _process(delta):
	if(do_splash_fadeout):
		$splash2.modulate.a -= delta / 2
		
		if($splash2.modulate.a < 0.01):
			$splash2.queue_free()
			do_splash_fadeout = false
