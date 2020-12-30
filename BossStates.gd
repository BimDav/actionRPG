tool
extends StateFactory

export(NodePath) var kbody_node_path = ""
export(NodePath) var animated_sprite_node_path = ""

onready var charge = $Charge
onready var prepare_charge = $PrepareCharge
var stats = PlayerStats

signal hit_wall
	
func _ready():
	var node = get_node(kbody_node_path)
	for s in get_children():
		if "kbody" in s:
			s.kbody = node
	node = get_node(animated_sprite_node_path)
	for s in get_children():
		if "animated_sprite" in s:
			s.animated_sprite = node
			
	stats.connect("no_health", self, "on_player_dead")

func _on_Gate_gate_closed(body):
	change_state("PrepareCharge", body)

func signal_hit_wall():
	emit_signal("hit_wall")
	
func on_player_dead():
	change_state("Idle", null)
	
func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if kbody_node_path == "":
		warnings.append("Set a path to the KinematicBody2D referenced")
	if animated_sprite_node_path == "":
		warnings.append("Set a path to the AnimatedSprite referenced")
	return warnings.join("\n")
