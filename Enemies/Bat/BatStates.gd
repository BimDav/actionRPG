tool
extends StateFactory

export(NodePath) var kbody_node_path = ""
export(NodePath) var animated_sprite_node_path = ""
export(NodePath) var detection_zone_node_path = ""
export(NodePath) var soft_collision_node_path = ""

func _ready():
	var node = get_node(kbody_node_path)
	for s in get_children():
		if "kbody" in s:
			s.kbody = node
	node = get_node(animated_sprite_node_path)
	for s in get_children():
		if "animated_sprite" in s:
			s.animated_sprite = node
	node = get_node(detection_zone_node_path)
	for s in get_children():
		if "player_detection_zone" in s:
			s.player_detection_zone = node
	node = get_node(soft_collision_node_path)
	for s in get_children():
		if "soft_collision" in s:
			s.soft_collision = node

func _on_PlayerDetectionZone_player_detected():
	state.handle_event("player_detected")

func _on_PlayerDetectionZone_player_lost():
	state.handle_event("player_lost")


func _on_WanderController_new_target_position():
	state.handle_event("new_target_position")

func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if kbody_node_path == "":
		warnings.append("Set a path to the KinematicBody2D referenced")
	if animated_sprite_node_path == "":
		warnings.append("Set a path to the AnimatedSprite referenced")
	if detection_zone_node_path == "":
		warnings.append("Set a path to the DetectionZone referenced")
	if soft_collision_node_path == "":
		warnings.append("Set a path to the SoftCollision referenced")
	return warnings.join("\n")
