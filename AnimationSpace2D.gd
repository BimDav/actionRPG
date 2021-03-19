tool
extends Node

class_name AnimationSpace2D

enum {UP, DOWN, LEFT, RIGHT}
export(NodePath) var animation_player_path = "" setget set_animation_player_path
export(Array, Resource) var spaces setget set_spaces
export(int) var current_index := 0

onready var animation_player: AnimationPlayer = get_node(animation_player_path)
var current_blend := DOWN
var str_to_ind: Dictionary

func set_animation_player_path(value):
	animation_player_path = value
	update_configuration_warning()
	
func set_spaces(value):
	spaces = value
	for i in range(spaces.size()):
		str_to_ind[spaces[i].name] = i
	update_configuration_warning()
	
func update_space(name: String) -> void:
	var new_index: int = str_to_ind[name]
	if new_index != current_index:
		current_index = new_index
		update_animation()

func update_position(position: Vector2) -> void:
	var new_blend := get_blend_from_position(position)
	if new_blend != current_blend:
		current_blend = new_blend
		update_animation()
		
func update_animation() -> void:
	#var animation_position := animation_player.current_animation_position
	animation_player.play(get_animation_name())
	#animation_player.seek(animation_position)
	print(get_parent())
	print(animation_player)
	
func get_animation_name() -> String:
	var space = spaces[current_index]
	match current_blend:
		UP:
			return space.up
		DOWN:
			return space.down
		RIGHT:
			return space.right
		_:
			return space.left

func get_blend_from_position(position: Vector2) -> int:
	var angle := position.angle()
	if angle >= 3*PI/4 or angle < -3*PI/4:
		return LEFT
	if angle > PI/4:
		return DOWN
	if angle >= -PI/4:
		return RIGHT
	return UP

func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if animation_player_path == "":
		warnings.append("Set a path to the AnimationPlayer referenced")
	if spaces.size() == 0:
		warnings.append("Use at least one animation space")
	return warnings.join("\n")
