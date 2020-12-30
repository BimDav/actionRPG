extends BaseBatState

onready var wander_controller = $WanderController

func process_state(delta):
	var target_position = wander_controller.target_position
	if kbody.global_position.distance_to(target_position) > kbody.max_speed * delta * 60:
		velocity = velocity.move_toward(kbody.global_position.direction_to(target_position) * kbody.max_speed,
		kbody.global_position.distance_to(target_position) * delta)
	else:
		next_state("Idle", velocity)
	.process_state(delta)
		
func handle_event(event):
	if event == "player_detected":
		next_state("Chase", velocity)

