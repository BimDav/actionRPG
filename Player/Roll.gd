extends State

export var roll_speed = 2.3
var roll_vector = Vector2.DOWN
var animation_tree
var animation_state
var hurtbox
var kbody

func enter(roll_vector_):
	animation_state.travel("Roll")
	hurtbox.invincible = true
	roll_vector = roll_vector_
	animation_tree.set("parameters/Roll/blend_position", roll_vector_)
	
func handle_input(event):
	if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
		return event
	return null
	
func process_state(_delta):
	var velocity = roll_vector * roll_speed
	velocity = kbody.move_and_slide(velocity * 60) / 60
		
func handle_event(event):
	if event == "roll_end":
		next_state("Move", null)
	
func exit():
	hurtbox.invincible = false
