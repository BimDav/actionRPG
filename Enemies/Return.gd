extends State

var return_position
export(int) var distance_max = 20

func set_main_ref(main_ref):
	.set_main_ref(main_ref)
	return_position = main.global_position

func process_state(delta):
	var vector = (return_position - main.global_position)
	var direction = vector.normalized()
	main.velocity = main.velocity.move_toward(direction * main.max_speed, main.acceleration * 60 * delta)
	if vector.length() <= distance_max:
		main.stats.health = main.stats.max_health
		next_state("idle")
			
			
func handle_input(event):
	if event == "player_detected":
		next_state("prepare_charge")
