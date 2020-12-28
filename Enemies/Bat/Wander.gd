extends State


func process_state(delta):
	var target_position = main.wander_controller.target_position
	if main.global_position.distance_to(target_position) > main.max_speed * delta * 60:
		main.velocity = main.velocity.move_toward(main.global_position.direction_to(target_position) * main.max_speed,
		main.global_position.distance_to(target_position) * delta)
	else:
		next_state("Idle", null)
		
func handle_event(event):
	if event == "player_detected":
		next_state("Chase", null)

