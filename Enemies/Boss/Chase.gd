extends BaseBatState

var player_detection_zone

func process_state(delta):
	var player = player_detection_zone.player
	var direction = (player.global_position - kbody.global_position).normalized()
	velocity = velocity.move_toward(direction * kbody.max_speed, kbody.acceleration * 60 * delta)
	.process_state(delta)
	
func handle_event(event):
	if event == "player_lost":
		next_state("Idle", velocity)
			
