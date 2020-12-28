extends State

func enter(_args):
	main.animation_state.travel("Attack")
	main.velocity = Vector2.ZERO
	
func handle_input(event):
	if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
		return event
	return null
	
func handle_event(event):
	if event == "attack_end":
		next_state("Move", null)


