extends Node2D

class_name DeathEffectLauncher

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")


func _on_Stats_no_health():
	get_parent().queue_free()
	var enemy_death_effect = EnemyDeathEffect.instance()
	enemy_death_effect.set_global_transform(get_global_transform())
	GameEvents.emit_signal("add_child_asked", enemy_death_effect)
