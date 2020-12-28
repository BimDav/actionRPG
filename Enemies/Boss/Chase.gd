extends State

func process_state(delta):
	var player = main.player_detection_zone.player
	var direction = (player.global_position - main.global_position).normalized()
	main.velocity = main.velocity.move_toward(direction * main.max_speed, main.acceleration * 60 * delta)
	
func handle_event(event):
	if event == "player_lost":
		next_state("Idle", null)
			
