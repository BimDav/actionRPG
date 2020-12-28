extends State

onready var timer = $Timer
var player

var charge_vector

func enter(player_):
	if player_ != null:
		player = player_
	var charge_wait = rand_range(0.5, 1.5)
	timer.start(charge_wait)
	main.velocity = Vector2.ZERO
	
func exit():
	timer.stop()

func _on_Timer_timeout():
	next_state("Charge", charge_vector)
	
func process_state(delta):
	var knockback = main.knockback.move_toward(Vector2.ZERO, 13 * 60 * delta)
	main.knockback = main.move_and_slide(knockback)

	charge_vector = main.global_position.direction_to(player.global_position)
	main.animated_sprite.flip_h = charge_vector.x < 0
