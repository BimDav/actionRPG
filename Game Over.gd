extends CanvasLayer

signal game_over_finished

func _on_AnimationPlayer_animation_finished(_anim_name):
	emit_signal("game_over_finished")
