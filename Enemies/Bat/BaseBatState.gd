extends State

class_name BaseBatState

var kbody
var animated_sprite
var soft_collision
var velocity = Vector2.ZERO

func enter(velocity_):
	if velocity_ != null:
		velocity = velocity_

func process_state(delta):
	var knockback = kbody.knockback.move_toward(Vector2.ZERO, 13 * 60 * delta)
	kbody.knockback = kbody.move_and_slide(knockback)
	
	animated_sprite.flip_h = velocity.x < 0
	velocity += soft_collision.get_push_vector() * delta * 60 * 0.3
	velocity = kbody.move_and_slide(velocity * 60) / 60
