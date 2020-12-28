tool
extends StateFactory

func _on_PlayerDetectionZone_player_detected():
	state.handle_event("player_detected")

func _on_PlayerDetectionZone_player_lost():
	state.handle_event("player_lost")


func _on_WanderController_new_target_position():
	state.handle_event("new_target_position")
