extends Node2D

export(int) var wander_range = 32

onready var start_position = global_position
onready var target_position = global_position
onready var timer = $Timer

signal new_target_position

func update_target_position():
	var target_vector = Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range))
	target_position = start_position + target_vector
	emit_signal("new_target_position")

func _on_Timer_timeout():
	update_target_position()
	timer.start(rand_range(1, 3))
