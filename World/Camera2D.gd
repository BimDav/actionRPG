extends Camera2D

onready var top_left = $Limits/TopLeft
onready var bottom_right = $Limits/BottomRight
var shake = false
onready var timer = $ShakeTimer

func _ready():
	limit_top = top_left.position.y
	limit_left = top_left.position.x
	limit_right = bottom_right.position.x
	limit_bottom = bottom_right.position.y
	
	# Animate this to increase/decrease/fade the shaking
var shake_amount = 1.0

func _process(_delta):
	if shake:
		set_offset(Vector2( \
			rand_range(-1.0, 1.0) * shake_amount, \
			rand_range(-1.0, 1.0) * shake_amount \
		))


func _on_ShakeTimer_timeout():
	shake = false


func _on_Boss_hit_wall():
	shake = true
	timer.start()
	


func _on_Boss_boss_cut_scene(position):
	set_transform(position)
