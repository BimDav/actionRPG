extends YSort

onready var grass = $Grass
onready var bats = $Bats
onready var boss = $Boss
onready var player = $Player
onready var gate = $Gate

func _ready():
	for g in grass.get_children():
		g.connect("object_generated", self, "add_child_on_signal")
		g.connect("grass_effect_launch", self, "add_child_on_signal")
	for b in bats.get_children():
		b.connect("object_generated", self, "add_child_on_signal")
		b.connect("enemy_death_effect_launch", self, "add_child_on_signal")
	boss.connect("object_generated", self, "add_child_on_signal")
	player.connect("player_hurt_sound_launch", self, "add_child_on_signal")
	gate.connect("grass_effect_launch", self, "add_child_on_signal")
	gate.connect("enemy_death_effect_launch", self, "add_child_on_signal")

func add_child_on_signal(node):
	call_deferred("add_child", node)
