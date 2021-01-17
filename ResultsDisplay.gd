extends CanvasLayer

export(Resource) var results = results as Results

var animation_finished = false
signal reload

func _ready():
	GameEvents.connect("results_display", self, "_on_results_updated")
	load_resource()
	

func _on_results_updated(results_):
	results = results_
	load_resource()
	$Label.visible = true
	$ColorRect.visible = true
	$AnimationPlayer.play("FadeIn")
	
	
func load_resource():
	var animation = $AnimationPlayer.get_animation("FadeIn")
	var track_nb = animation.find_track("ColorRect:color")
	animation.track_set_key_value(track_nb, 1, results.color)
	$Label.text = results.text
	

func _on_AnimationPlayer_animation_finished(_anim_name):
	animation_finished = true

func _input(event):
	if animation_finished:
		if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
			emit_signal("reload")
