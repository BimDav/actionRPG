extends State

export var acceleration = 2.2
export var max_speed = 2
export var friction = 2

func handle_input(event):
	if event.is_action_pressed("attack"):
		next_state("Attack", null)
	elif event.is_action_pressed("roll"):
		next_state("Roll", null)
	return null
	
func process_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		main.roll_vector = input_vector
		main.sword_hitbox.knockback_vector = input_vector
		main.animation_tree.set("parameters/Idle/blend_position", input_vector)
		main.animation_tree.set("parameters/Run/blend_position", input_vector)
		main.animation_tree.set("parameters/Attack/blend_position", input_vector)
		main.animation_tree.set("parameters/Roll/blend_position", input_vector)
		main.animation_state.travel("Run")
	else:
		main.animation_state.travel("Idle")
	
	var velocity = main.velocity
	velocity += input_vector * acceleration * delta * 60
	velocity = velocity.move_toward(Vector2.ZERO, friction * delta * 60)
	velocity = velocity * 60
	velocity = velocity.clamped(max_speed)
	
	main.velocity = main.move_and_slide(velocity * 60) / 60
