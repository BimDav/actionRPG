extends Area2D

var invincible = false setget set_invincible

var hit_effect = preload("res://Effects/HitEffect.tscn")

signal invincibility_started
signal invincibility_stopped

onready var timer = $Timer
onready var collision_shape = $CollisionShape2D

func _on_Hurtbox_area_entered(_area):
	var effect = hit_effect.instance()
	effect.set_global_transform(get_global_transform())
	GameEvents.emit_signal("add_child_asked", effect)
	self.invincible = true
	emit_signal("invincibility_started")
	timer.start()

func _on_Timer_timeout():
	self.invincible = false
	emit_signal("invincibility_stopped")
	
func set_invincible(value):
	invincible = value
	collision_shape.set_deferred("disabled", invincible)
