extends KinematicBody2D

class_name KinematicEnemy

export(float) var acceleration = 0.1
export(float) var max_speed = 0.8
export(float) var friction = 1

var knockback = Vector2.ZERO
var velocity = Vector2.ZERO


func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 4.2 * 60
