tool
extends StateFactory

export(NodePath) var kbody_node_path = ""
export(NodePath) var animation_tree_node_path = ""
export(NodePath) var sword_hitbox_node_path = ""
export(NodePath) var hurtbox_node_path = ""

var input_buffer = null

onready var input_buffer_timer = $InputBufferTimer


func _ready():
	var node = get_node(kbody_node_path)
	for s in get_children():
		if "kbody" in s:
			s.kbody = node
	node = get_node(animation_tree_node_path)
	for s in get_children():
		if "animation_tree" in s:
			s.animation_tree = node
		if "animation_state" in s:
			s.animation_state = node.get("parameters/playback")
	node = get_node(sword_hitbox_node_path)
	for s in get_children():
		if "sword_hitbox" in s:
			s.sword_hitbox = node
	node = get_node(hurtbox_node_path)
	for s in get_children():
		if "hurtbox" in s:
			s.hurtbox = node
	
func _on_PlayerStates_state_changed():
	if input_buffer != null:
		state.handle_input(input_buffer)
		input_buffer = null
	
func _input(event):
	var filtered_event = state.handle_input(event)
	if filtered_event != null:
		input_buffer = filtered_event
		input_buffer_timer.start()
		
	
func _on_attack_animation_finished():
	state.handle_event("attack_end")
		
func _on_roll_animation_finished():
	state.handle_event("roll_end")

func _on_InputBufferTimer_timeout():
	input_buffer = null
	
	
func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if kbody_node_path == "":
		warnings.append("Set a path to the KinematicBody2D referenced")
	if animation_tree_node_path == "":
		warnings.append("Set a path to the AnimationTree referenced")
	if sword_hitbox_node_path == "":
		warnings.append("Set a path to the SwordHitbox referenced")
	if hurtbox_node_path == "":
		warnings.append("Set a path to the Hurtbox referenced")
	return warnings.join("\n")

