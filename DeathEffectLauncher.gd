extends Node2D

class_name DeathEffectLauncher

signal enemy_death_effect_launch(node)

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")


func _on_Stats_no_health():
	get_parent().queue_free()
	var enemy_death_effect = EnemyDeathEffect.instance()
	enemy_death_effect.set_global_transform(get_global_transform())
	emit_signal("enemy_death_effect_launch", enemy_death_effect)
