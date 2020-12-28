extends Area2D

func _on_Heart_area_entered(_area):
	PlayerStats.health += 1
	call_deferred("queue_free")

