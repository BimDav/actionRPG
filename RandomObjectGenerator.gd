extends Node2D

export(float) var heart_ratio = 0.2
const heart = preload("res://World/Heart.tscn")

signal generated_object(object_node, offset)

func _exit_tree():
	var rand = randf()
	if rand <= heart_ratio:
		var heart_node = heart.instance()
		emit_signal("generated_object", heart_node, position)

