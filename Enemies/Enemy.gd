extends KinematicBody2D

class_name Enemy

export(float) var acceleration = 0.1
export(float) var max_speed = 0.8
export(float) var friction = 1

signal object_generated(object_node)
signal enemy_death_effect_launch(node)

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

var knockback = Vector2.ZERO
var velocity = Vector2.ZERO

onready var stats = $Stats
onready var animated_sprite = $AnimatedSprite
onready var soft_collision = $SoftCollision
onready var blink_animation_player = $BlinkAnimationPlayer


func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 4.2 * 60
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
