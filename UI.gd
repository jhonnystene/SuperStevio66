extends CanvasLayer

func _process(_delta):
	$Control/Label.text = str(Global.stevens)
	$Control/Label2.text = Global.get_time()
	
