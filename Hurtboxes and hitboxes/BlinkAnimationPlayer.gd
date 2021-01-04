tool
extends AnimationPlayer

export(NodePath) var sprite_node_path = ""

func _ready():
	var blink = get_animation("Blink")
	blink.add_track(Animation.TYPE_VALUE)
	var path = String(sprite_node_path) + ":material:shader_param/active"
	blink.track_set_path(0, path)
	blink.track_insert_key(0, 0.0, true)
	blink.track_insert_key(0, 0.1, false)
	blink.length = 0.2
	blink.loop = true
	
func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if sprite_node_path == "":
		warnings.append("Set a path to the Sprite referenced")
	return warnings.join("\n")
