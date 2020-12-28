tool
extends StateFactory

onready var charge = $Charge
onready var prepare_charge = $PrepareCharge
var stats = PlayerStats

signal hit_wall
	
func _ready():
	charge.connect("hit_wall", self, "signal_hit_wall")
	stats.connect("no_health", self, "on_player_dead")

func _on_Gate_gate_closed(body):
	change_state("PrepareCharge", body)

func signal_hit_wall():
	emit_signal("hit_wall")
	
func on_player_dead():
	change_state("Idle", null)
