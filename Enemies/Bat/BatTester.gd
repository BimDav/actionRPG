extends Node

onready var bat = $Bat
onready var states = $Bat/BatStates
onready var state = states.state
onready var wander_target = $WanderTarget
onready var wander_controller = $Bat/BatStates/Wander/WanderController

func _ready():
	$StartPosition.position = bat.position

func _on_BatStates_state_changed():
	state = states.state
	print(state)


func _on_WanderController_new_target_position():
	wander_target.global_position = wander_controller.target_position
