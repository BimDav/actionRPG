extends State

func process_state(delta):
	main.velocity = main.velocity.move_toward(Vector2.ZERO, main.friction * delta * 60)
	
func handle_event(event):
	if event == "player_detected":
		next_state("Chase", null)
	elif event == "new_target_position":
		next_state("Wander", null)
