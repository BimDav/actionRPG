extends BaseBatState

func process_state(delta):
	velocity = velocity.move_toward(Vector2.ZERO, kbody.friction * delta * 60)
	.process_state(delta)
	
func handle_event(event):
	if event == "player_detected":
		next_state("Chase", velocity)
	elif event == "new_target_position":
		next_state("Wander", velocity)
