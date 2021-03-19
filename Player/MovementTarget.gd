extends Node2D

signal new_target(position)

func _input(event):
	event = event as InputEventMouseButton
	if event and event.button_index == BUTTON_RIGHT and event.pressed:
		global_position = event.position
		emit_signal("new_target", event.position)
