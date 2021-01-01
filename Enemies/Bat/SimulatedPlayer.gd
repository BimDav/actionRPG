extends KinematicBody2D


func _physics_process(_delta):
	if Input.is_action_pressed("click"):
		global_position = get_global_mouse_position()
