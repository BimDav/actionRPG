extends CanvasLayer

var animation_finished = false
signal reload

func _on_AnimationPlayer_animation_finished(_anim_name):
	animation_finished = true

func _input(event):
	if animation_finished:
		if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
			emit_signal("reload")
