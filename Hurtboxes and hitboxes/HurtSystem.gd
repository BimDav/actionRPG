extends Node2D

class_name HurtSystem

onready var stats = $Stats
onready var blink_animation_player = $BlinkAnimationPlayer

func _ready():
	blink_animation_player.play("BlinkAnimationStop")


func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage

func _on_Hurtbox_invincibility_started():
	blink_animation_player.play("BlinkAnimation")	

func _on_Hurtbox_invincibility_stopped():
	blink_animation_player.play("BlinkAnimationStop")
