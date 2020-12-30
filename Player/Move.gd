extends State

var roll_vector = Vector2.DOWN
var kbody
var animation_tree
var animation_state
var velocity = Vector2.ZERO

func enter(_args):
	velocity = Vector2.ZERO

func handle_input(event):
	if event.is_action_pressed("attack"):
		next_state("Attack", roll_vector)
	elif event.is_action_pressed("roll"):
		next_state("Roll", roll_vector)
	return null
	
func process_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_state.travel("Run")
	else:
		animation_state.travel("Idle")
	
	velocity += input_vector * kbody.acceleration * delta * 60
	velocity = velocity.move_toward(Vector2.ZERO, kbody.friction * delta * 60)
	velocity = velocity * 60
	velocity = velocity.clamped(kbody.max_speed)
	
	velocity = kbody.move_and_slide(velocity * 60) / 60
