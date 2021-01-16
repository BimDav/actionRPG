extends Node2D

export(float) var heart_ratio = 0.2
const heart = preload("res://World/Heart.tscn")

func _exit_tree():
	var rand = randf()
	if rand <= heart_ratio:
		var heart_node = heart.instance()
		heart_node.set_global_transform(get_global_transform())
		GameEvents.emit_signal("add_child_asked", heart_node)
		
