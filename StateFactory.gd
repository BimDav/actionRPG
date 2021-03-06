tool
extends Node

class_name StateFactory

signal state_changed

var state = null

export(NodePath) var init_state_path = ""

func _ready():
	state = get_node(init_state_path)
	state.enter(null)
	
func _physics_process(delta):
	if not Engine.editor_hint:
		state.process_state(delta)
	
func change_state(new_state_name, args):
	var new_state = get_node(new_state_name)
	state.exit()
	state = new_state
	state.enter(args)
	emit_signal("state_changed")
	
func _on_animation_finished():
	state._on_animation_finished()

func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if init_state_path == "":
		warnings.append("Set an initial state")
	return warnings.join("\n")
	

