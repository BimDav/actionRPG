extends State

signal hit_wall

var charge_vector
export(Color) var modulate_charge = Color(0.53, 0.03, 0.16, 1)
var base_modulate

var animated_sprite
var velocity
var kbody

func enter(charge_vector_):
	charge_vector = charge_vector_
	base_modulate = animated_sprite.modulate
	animated_sprite.modulate = modulate_charge
	velocity = Vector2.ZERO
	
func exit():
	animated_sprite.modulate = base_modulate

func process_state(delta):
	velocity = velocity.move_toward(charge_vector * 8* kbody.max_speed,
	 kbody.acceleration * 60 * delta)

	animated_sprite.flip_h = velocity.x < 0
	var collision = kbody.move_and_collide(velocity * 60 * delta)
	if collision != null and charge_vector.dot(collision.normal) < 0:
		next_state("PrepareCharge", null)
		emit_signal("hit_wall")

			
