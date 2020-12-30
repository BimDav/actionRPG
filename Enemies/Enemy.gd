extends YSort

class_name Enemy

signal object_generated(object_node)
signal enemy_death_effect_launch(node)

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

onready var stats = $Stats
onready var animated_sprite = $KinematicBody2D/AnimatedSprite
onready var soft_collision = $KinematicBody2D/SoftCollision
onready var blink_animation_player = $BlinkAnimationPlayer


func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	blink_animation_player.play("Start")
	

func _on_Stats_no_health():
	queue_free()
	var enemy_death_effect = EnemyDeathEffect.instance()
	enemy_death_effect.set_transform(get_transform())
	enemy_death_effect.set_offset(Vector2(0,-14))
	emit_signal("enemy_death_effect_launch", enemy_death_effect)


func _on_Hurtbox_invincibility_stopped():
	blink_animation_player.play("Stop")


func _on_RandomObjectGenerators_generated_object(object_node, offset):
	object_node.set_transform(get_transform())
	object_node.position += offset
	emit_signal("object_generated", object_node)
