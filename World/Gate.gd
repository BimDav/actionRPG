extends Area2D

signal gate_closed

onready var sprite = $Bush/Sprite
onready var shadow_sprite = $Bush/ShadowSprite

const GrassEffect = preload("res://Effects/GrassEffect.tscn")
const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

signal grass_effect_launch(grass_effect_node)
signal enemy_death_effect_launch(death_effect_node)

func create_grass_effect():
	var grass_effect = GrassEffect.instance()
	grass_effect.set_transform(get_transform())
	emit_signal("grass_effect_launch", grass_effect)
	
func create_death_effect():
	var death_effect = EnemyDeathEffect.instance()
	death_effect.set_transform(get_transform())
	emit_signal("enemy_death_effect_launch", death_effect)	

func _on_Gate_body_exited(body):
	if body.global_position.y <= global_position.y:
		sprite.visible = true
		shadow_sprite.visible = true
		create_grass_effect()
		emit_signal("gate_closed", body)


func _on_Boss_dead():
	create_death_effect()
	queue_free()
