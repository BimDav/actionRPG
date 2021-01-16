extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")

func create_grass_effect():
	var grass_effect = GrassEffect.instance()
	grass_effect.set_transform(get_transform())
	GameEvents.emit_signal("add_child_asked", grass_effect)


func _on_Hurtbox_area_entered(_area):
	create_grass_effect()
	queue_free()
	
