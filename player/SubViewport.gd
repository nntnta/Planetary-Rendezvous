extends SubViewport

@onready var camera = $Camera2D

func _ready():
	$minimap_bg.position = $"../../../../bg".position
	$minimap_bg.scale.x = $"../../../../bg".scale.x
	$minimap_bg.scale.y = $"../../../../bg".scale.y
	$minimap_rocket.position = $"../../../../spawn_player".position


func _physics_process(_delta):
	camera.global_position = $"../../..".position
	
