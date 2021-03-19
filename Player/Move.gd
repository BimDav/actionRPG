extends State

var roll_vector = Vector2.DOWN
var movement_target := Vector2.ZERO
var kbody: KinematicBody2D
var animation_space: AnimationSpace2D
var velocity = Vector2.ZERO

func enter(position):
	velocity = Vector2.ZERO
	movement_target = position
	animation_space.update_space("Run")

func handle_input(event):
	var event_mouse = event as InputEventMouseButton
	if event_mouse and event_mouse.button_index == BUTTON_RIGHT and event_mouse.pressed:
		movement_target = kbody.get_global_mouse_position()
	elif event.is_action_pressed("attack"):
		next_state("Attack", direction())
	elif event.is_action_pressed("roll"):
		next_state("Roll", direction())
	return null
	
func process_state(delta):
	if get_parent().is_selected and Input.is_mouse_button_pressed(BUTTON_RIGHT):
		movement_target = kbody.get_global_mouse_position()
	var input_vector = movement_target - kbody.global_position
	
	if input_vector.length() > 3:
		input_vector = input_vector.normalized()
		velocity += input_vector * kbody.acceleration * delta * 60
		roll_vector = input_vector
		animation_space.update_position(input_vector)
	else:
		next_state("Idle", null)
	
	velocity = velocity.move_toward(Vector2.ZERO, kbody.friction * delta * 60)
	velocity = velocity * 60
	velocity = velocity.clamped(kbody.max_speed)
	
	velocity = kbody.move_and_slide(velocity * 60) / 60
	
func direction():
	return (kbody.get_global_mouse_position() - kbody.global_position).normalized()
