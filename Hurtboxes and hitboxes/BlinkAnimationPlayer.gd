tool
extends AnimationPlayer

export(NodePath) var sprite_node_path = ""

func _ready():
	var path = String(sprite_node_path) + ":material:shader_param/active"
	var blink = get_animation("BlinkAnimation")
	blink.track_set_path(0, path)
	blink = get_animation("BlinkAnimationStop")
	blink.track_set_path(0, path)
	
func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if sprite_node_path == "":
		warnings.append("Set a path to the Sprite referenced")
	return warnings.join("\n")
