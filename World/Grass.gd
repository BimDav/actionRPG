extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")

signal grass_effect_launch(grass_effect_node)

func create_grass_effect():
	var grass_effect = GrassEffect.instance()
	grass_effect.set_transform(get_transform())
	emit_signal("grass_effect_launch", grass_effect)



func _on_Hurtbox_area_entered(_area):
	create_grass_effect()
	queue_free()
	
