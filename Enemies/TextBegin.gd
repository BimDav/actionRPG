extends CanvasLayer


func _input(event):
	if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
		queue_free()
