tool
extends StateFactory

export(NodePath) var kbody_node_path = ""
export(NodePath) var animation_space_node_path = ""
export(NodePath) var sword_hitbox_node_path = ""
export(NodePath) var hurtbox_node_path = ""
export(NodePath) var shadow_sprite_node_path = ""

var input_buffer = null
var main_node

var is_selected := false setget set_selected
var shadow_sprite: Sprite

onready var input_buffer_timer = $InputBufferTimer


func _ready():
	var node = get_node(kbody_node_path)
	for s in get_children():
		if "kbody" in s:
			s.kbody = node
	node = get_node(animation_space_node_path)
	for s in get_children():
		if "animation_space" in s:
			s.animation_space = node
	node = get_node(sword_hitbox_node_path)
	for s in get_children():
		if "sword_hitbox" in s:
			s.sword_hitbox = node
	node = get_node(hurtbox_node_path)
	for s in get_children():
		if "hurtbox" in s:
			s.hurtbox = node
	shadow_sprite = get_node(shadow_sprite_node_path)
	
func _on_PlayerStates_state_changed():
	if input_buffer != null:
		state.handle_input(input_buffer)
		input_buffer = null
	
func _input(event):
	if is_selected:
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
	
func set_selected(value):
	is_selected = value
	shadow_sprite.material.set_shader_param("active", value)
	
	
func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if kbody_node_path == "":
		warnings.append("Set a path to the KinematicBody2D referenced")
	if animation_space_node_path == "":
		warnings.append("Set a path to the AnimationSpace referenced")
	if sword_hitbox_node_path == "":
		warnings.append("Set a path to the SwordHitbox referenced")
	if hurtbox_node_path == "":
		warnings.append("Set a path to the Hurtbox referenced")
	if shadow_sprite_node_path == "":
		warnings.append("Set a path to the Shadow Sprite referenced")
	return warnings.join("\n")


func _on_KinematicComponent2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	event = event as InputEventMouseButton
	if event and event.button_index == BUTTON_LEFT and event.pressed:
		self.is_selected = true
		get_tree().set_input_as_handled()
		
func _unhandled_input(event: InputEvent) -> void:
	event = event as InputEventMouseButton
	if event and event.button_index == BUTTON_LEFT and event.pressed:
		self.is_selected = false
		


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if "Roll" in anim_name:
		state.handle_event("roll_end")
	elif "Attack" in anim_name:
		state.handle_event("attack_end")
