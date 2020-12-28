extends State

export var roll_speed = 2.3

func enter(_args):
	main.animation_state.travel("Roll")
	main.hurtbox.invincible = true
	
func handle_input(event):
	if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
		return event
	return null
	
func process_state(_delta):
	var velocity = main.roll_vector * roll_speed
	main.velocity = main.move_and_slide(velocity * 60) / 60
		
func handle_event(event):
	if event == "roll_end":
		next_state("Move", null)
	
func exit():
	main.velocity = Vector2.ZERO
	main.hurtbox.invincible = false
