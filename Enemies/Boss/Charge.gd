extends State

signal hit_wall

var charge_vector
export(Color) var modulate_charge = Color(0.53, 0.03, 0.16, 1)
var base_modulate

func enter(charge_vector_):
	charge_vector = charge_vector_
	base_modulate = main.animated_sprite.modulate
	main.animated_sprite.modulate = modulate_charge
	
func exit():
	main.animated_sprite.modulate = base_modulate

func process_state(delta):
	main.velocity = main.velocity.move_toward(charge_vector * 8* main.max_speed,
	 main.acceleration * 60 * delta)

	main.animated_sprite.flip_h = main.velocity.x < 0
	var collision = main.move_and_collide(main.velocity * 60 * delta)
	if collision != null and charge_vector.dot(collision.normal) < 0:
		next_state("PrepareCharge", null)
		emit_signal("hit_wall")

			
