extends Node2D

export(float) var heart_ratio = 0.2
const heart = preload("res://World/Heart.tscn")

signal object_generated(object_node)

func _exit_tree():
	var rand = randf()
	if rand <= heart_ratio:
		var heart_node = heart.instance()
		heart_node.set_global_transform(get_global_transform())
		emit_signal("object_generated", heart_node)
		
