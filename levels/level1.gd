extends Node2D

func _process(_delta):
	if(is_instance_valid($Marlio)):
		$Camera2D.global_position = $Marlio/Camera2D.global_position
