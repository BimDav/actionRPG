tool
extends StateFactory

var input_buffer = null

onready var input_buffer_timer = $InputBufferTimer

	
func _on_PlayerStates_state_changed():
	if input_buffer != null:
		state.handle_input(input_buffer)
		input_buffer = null
	
func _input(event):
	var filtered_event = state.handle_input(event)
	if filtered_event != null:
		input_buffer = filtered_event
		input_buffer_timer.start()
		
	
func _on_attack_animation_finished():
	state.handle_event("attack_end")
		
func _on_roll_animation_finished():
	state.handle_event("roll_end")

func _on_InputBufferTimer_timeout():
	input_buffer = null
