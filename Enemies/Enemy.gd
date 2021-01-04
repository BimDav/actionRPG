extends Node2D

class_name Enemy

onready var stats = $Stats
onready var animated_sprite = $AnimatedSprite
onready var soft_collision = $SoftCollision
onready var blink_animation_player = $BlinkAnimationPlayer


func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	blink_animation_player.play("Start")
	

func _on_Hurtbox_invincibility_stopped():
	blink_animation_player.play("Stop")
