extends YSort

onready var grass = $Grass
onready var bats = $Bats
onready var boss = $Boss
onready var player = $Player
onready var gate = $Gate

func _ready():
	for g in grass.get_children():
		g.get_node("RandomObjectGenerator").connect("object_generated", self, "add_child_on_signal")
		g.connect("grass_effect_launch", self, "add_child_on_signal")
	for b in bats.get_children():
		b.get_node("RandomObjectGenerator").connect("object_generated", self, "add_child_on_signal")
		b.get_node("DeathEffectLauncher").connect("enemy_death_effect_launch", self, "add_child_on_signal")
	boss.get_node("RandomObjectGenerator").connect("object_generated", self, "add_child_on_signal")
	boss.get_node("RandomObjectGenerator2").connect("object_generated", self, "add_child_on_signal")
	boss.get_node("DeathEffectLauncher").connect("enemy_death_effect_launch", self, "add_child_on_signal")
	player.connect("player_hurt_sound_launch", self, "add_child_on_signal")
	gate.connect("grass_effect_launch", self, "add_child_on_signal")
	gate.connect("enemy_death_effect_launch", self, "add_child_on_signal")

func add_child_on_signal(node):
	call_deferred("add_child", node)
