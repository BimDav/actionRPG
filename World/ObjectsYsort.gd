extends YSort

onready var grass = $Grass
onready var bats = $Bats
onready var boss = $Boss
onready var player = $Player
onready var gate = $Gate

func _ready():
	GameEvents.connect("add_child_asked", self, "add_child_on_signal")

func add_child_on_signal(node):
	call_deferred("add_child", node)
