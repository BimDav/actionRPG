tool
extends KinematicBody2D

class_name KinematicComponent2D

export(NodePath) var remote_path = ""
onready var remote_node = get_node(remote_path) as Node2D
onready var base_transform = get_transform()

func move_and_slide(linear_velocity: Vector2, up_direction: Vector2 = Vector2( 0, 0 ),
 stop_on_slope: bool = false, max_slides: int = 4, floor_max_angle: float = 0.785398,
 infinite_inertia: bool = true) -> Vector2:
	var ret: Vector2 = .move_and_slide(linear_velocity, up_direction, stop_on_slope,
								max_slides, floor_max_angle, infinite_inertia)
	var new_transform = get_global_transform()
	remote_node.set_global_transform(new_transform)
	set_transform(base_transform)
	return ret
	
	
func move_and_collide(rel_vec: Vector2, infinite_inertia: bool = true, 
exclude_raycast_shapes: bool = true, test_only: bool = false) -> KinematicCollision2D:
	var ret = .move_and_collide(rel_vec, infinite_inertia, exclude_raycast_shapes,
								test_only)
	var new_transform = get_global_transform()
	remote_node.set_global_transform(new_transform)
	set_transform(base_transform)
	return ret	

func _get_configuration_warning() -> String:
	var warnings = PoolStringArray()
	if remote_path == "":
		warnings.append("Set a path to the owner")
	return warnings.join("\n")
