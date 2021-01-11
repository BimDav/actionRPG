extends Node2D

var player_stats = PlayerStats
const game_over = preload("res://Game Over.tscn")
const congratulations = preload("res://Congratulations.tscn")

func _ready():
	player_stats.health = player_stats.max_health
	player_stats.connect("no_health", self, "game_over_launch")
	
func game_over_launch():
	var game_over_instance = game_over.instance()
	add_child(game_over_instance)
	game_over_instance.connect("reload", self, "reload")
	
func reload():
	var _c = get_tree().change_scene("res://World.tscn")

func _on_Boss_dead():
	var congratulations_instance = congratulations.instance()
	add_child(congratulations_instance)
	congratulations_instance.connect("reload", self, "reload")
