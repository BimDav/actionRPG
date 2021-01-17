extends Node2D

var player_stats = PlayerStats
const game_over = preload("res://GameOver.tres")
const congratulations = preload("res://Congratulations.tres")

func _ready():
	player_stats.health = player_stats.max_health
	player_stats.connect("no_health", self, "game_over_launch")
	
func game_over_launch():
	GameEvents.emit_signal("results_display", game_over)

func _on_Boss_dead():
	GameEvents.emit_signal("results_display", congratulations)


func _on_ResultsDisplay_reload():
	var _c = get_tree().change_scene("res://World.tscn")
