extends State

export var roll_speed = 2.3
var roll_vector = Vector2.DOWN
var animation_space: AnimationSpace2D
var hurtbox
var kbody

func enter(roll_vector_):
	animation_space.update_space("Roll")
	hurtbox.invincible = true
	roll_vector = roll_vector_
	
func handle_input(event):
	var event_mouse = event as InputEventMouseButton
	if event_mouse and event_mouse.button_index == BUTTON_RIGHT and event_mouse.pressed:
		return event_mouse
	if event.is_action_pressed("attack"):
		return event
	return null
	
func process_state(_delta):
	var velocity = roll_vector * roll_speed
	velocity = kbody.move_and_slide(velocity * 60) / 60
		
func handle_event(event):
	if event == "roll_end":
		next_state("Idle", null)
	
func exit():
	hurtbox.invincible = false
