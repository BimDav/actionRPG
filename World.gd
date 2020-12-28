extends Node2D

var player_stats = PlayerStats
const game_over = preload("res://Game Over.tscn")
var game_over_finished = false

func _ready():
	player_stats.health = player_stats.max_health
	player_stats.connect("no_health", self, "game_over_launch")
	
func _input(event):
	if game_over_finished:
		if event.is_action_pressed("attack") or event.is_action_pressed("roll"):
			reload()
	
func game_over_launch():
	var game_over_instance = game_over.instance()
	add_child(game_over_instance)
	game_over_instance.connect("game_over_finished", self, "set_game_over_finished")
	
func set_game_over_finished():
	game_over_finished = true
	
func reload():
	var _c = get_tree().change_scene("res://World.tscn")
