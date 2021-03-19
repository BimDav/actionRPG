extends State

var roll_vector = Vector2.DOWN
var animation_space: AnimationSpace2D
var kbody: KinematicBody2D

func enter(_args):
	animation_space.update_space("Idle")

func handle_input(event):
	var event_mouse = event as InputEventMouseButton
	if event_mouse and event_mouse.button_index == BUTTON_RIGHT and event_mouse.pressed:
		next_state("Move", kbody.get_global_mouse_position())
	elif event.is_action_pressed("attack"):
		next_state("Attack", direction())
	elif event.is_action_pressed("roll"):
		next_state("Roll", direction())
	return null
	
func process_state(_delta):
	if get_parent().is_selected and Input.is_mouse_button_pressed(BUTTON_RIGHT):
		var movement_target = kbody.get_global_mouse_position()
		var input_vector = movement_target - kbody.global_position

		if input_vector.length() > 3:
			next_state("Move", movement_target)

	
func direction():
	return (kbody.get_global_mouse_position() - kbody.global_position).normalized()
