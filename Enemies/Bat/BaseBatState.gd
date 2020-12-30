extends State

class_name BaseBatState

var kbody
var velocity = Vector2.ZERO

func enter(velocity_):
	if velocity_ != null:
		velocity = velocity_

func process_state(delta):
	var knockback = kbody.knockback.move_toward(Vector2.ZERO, 13 * 60 * delta)
	kbody.knockback = kbody.move_and_slide(knockback)
