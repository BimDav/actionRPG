extends YSort

signal player_hurt_sound_launch(node)

const player_hurt_sound = preload("res://Player/PlayerHurtSound.tscn")

var stats = PlayerStats

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")
onready var hurtbox = $KinematicBody2D/Hurtbox
onready var blink_animation_player = $BlinkAnimationPlayer
onready var player_states = $PlayerStates


func _ready():
	stats.connect("no_health", self, "queue_free")
	animation_tree.active = true
	

func _on_attack_animation_finished():
	player_states._on_attack_animation_finished()
		
func _on_roll_animation_finished():
	player_states._on_roll_animation_finished()

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	var player_hurt_sound_node = player_hurt_sound.instance()
	emit_signal("player_hurt_sound_launch", player_hurt_sound_node)


func _on_Hurtbox_invincibility_started():
	blink_animation_player.play("Start")

func _on_Hurtbox_invincibility_stopped():
	blink_animation_player.play("Stop")
