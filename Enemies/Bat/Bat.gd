extends Enemy

onready var wander_controller = $WanderController
onready var player_detection_zone = $PlayerDetectionZone

func init():
	.init()

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 13 * 60 * delta)
	knockback = move_and_slide(knockback)
	
	animated_sprite.flip_h = velocity.x < 0
	velocity += soft_collision.get_push_vector() * delta * 60 * 0.3
	velocity = move_and_slide(velocity * 60) / 60
