extends Node2D

const player_hurt_sound = preload("res://Player/PlayerHurtSound.tscn")

var stats = PlayerStats

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")
onready var player_states = $PlayerStates
onready var shadow_sprite: Sprite = $ShadowSprite

func _ready():
	stats.connect("no_health", self, "queue_free")
	animation_tree.active = true
	

func _on_attack_animation_finished():
	player_states._on_attack_animation_finished()
		
func _on_roll_animation_finished():
	player_states._on_roll_animation_finished()

func _on_Hurtbox_area_entered(_area):
	var player_hurt_sound_node = player_hurt_sound.instance()
	GameEvents.emit_signal("add_child_asked", player_hurt_sound_node)

