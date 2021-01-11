extends Node

class_name State

var main = null
var state_factory = null

func _ready():
	state_factory = get_parent()
	
func enter(_args):
	pass
	
func exit():
	pass
	
func handle_input(_event):
	return null
	
func process_state(_delta):
	pass
	
func handle_event(_event):
	pass

func next_state(next_state_name, args):
	state_factory.change_state(next_state_name, args)


