extends SubViewport
var limits
@onready var camera = $Camera2D

func _ready():
	$minimap_bg.position = $"../../../../bg".position
	$minimap_bg.scale.x = $"../../../../bg".scale.x
	$minimap_bg.scale.y = $"../../../../bg".scale.y
	$minimap_rocket.position = $"../../../../spawn_player".position
	limits = $minimap_bg.get_rect()
	#$Camera2D.limit_left = limits.position.x*3
	#$Camera2D.limit_top = limits.position.y*3
	#$Camera2D.limit_right = limits.end.x*3
	#$Camera2D.limit_bottom = limits.end.y*3

func _physics_process(_delta):
	
	camera.global_position = $"../../..".position
	
