extends Area2D

var player = null

signal player_detected
signal player_lost

func can_see_player():
	return player != null

func _on_PlayerDetectionZone_body_entered(body):
	player = body
	emit_signal("player_detected")


func _on_PlayerDetectionZone_body_exited(_body):
	player = null
	emit_signal("player_lost")
