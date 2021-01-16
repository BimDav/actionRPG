extends Node2D

signal dead
signal hit_wall
signal boss_cut_scene(position)

onready var cut_scene = $CutscenePlayer
onready var states = $BossStates

func _on_Stats_no_health():
	emit_signal("dead")


func _on_Gate_gate_closed(body):
	states._on_Gate_gate_closed(body)
	get_tree().paused = true
	cut_scene.play("CutScene")
	emit_signal("boss_cut_scene", get_transform())
	

func _on_BossStates_hit_wall():
	emit_signal("hit_wall")


func _on_CutscenePlayer_animation_finished(_anim_name):
	get_tree().paused = false
