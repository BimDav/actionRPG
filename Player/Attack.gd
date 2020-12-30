extends State

var animation_tree
var animation_state
var sword_hitbox

func enter(knockback_vector):
	animation_state.travel("Attack")
	sword_hitbox.knockback_vector = knockback_vector
	animation_tree.set("parameters/Attack/blend_position", knockback_vector)
	
func handle_input(event):
	if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
		return event
	return null
	
func handle_event(event):
	if event == "attack_end":
		next_state("Move", null)


