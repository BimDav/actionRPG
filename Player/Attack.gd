extends State

var animation_space: AnimationSpace2D
var sword_hitbox

func enter(direction):
	animation_space.update_space("Attack")
	sword_hitbox.knockback_vector = direction
	
func handle_input(event):
	var event_mouse = event as InputEventMouseButton
	if event_mouse and event_mouse.button_index == BUTTON_RIGHT and event_mouse.pressed:
		return event_mouse
	if event.is_action_pressed("roll"):
		return event
	return null
	
func handle_event(event):
	if event == "attack_end":
		next_state("Idle", null)


