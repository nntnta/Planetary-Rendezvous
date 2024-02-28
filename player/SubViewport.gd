extends SubViewport
var limits
@onready var camera = $Camera2D

func _ready():
	$"../pointer".visible = false
	$"../unique_pointer".visible = false
	$unique.visible = false
	#$ParallaxBackground/ParallaxLayer/minimap_bg.position = $"../../../../bg".position
	#$ParallaxBackground/ParallaxLayer/minimap_bg.scale.x = $"../../../../bg".scale.x
	#$ParallaxBackground/ParallaxLayer/minimap_bg.scale.y = $"../../../../bg".scale.y
	$minimap_rocket.position = $"../../../../spawn_player".position
	if $"../../../../unique":
		$unique.position = $"../../../../unique".position
		
	if $"../../../../stabilizer":
		$stabilizer.visible = true
		$stabilizer.position = $"../../../../stabilizer".position
	if !$"../../../../stabilizer":
		$stabilizer.visible = false
	#limits = $ParallaxBackground/ParallaxLayer/minimap_bg.get_rect()
	#$Camera2D.limit_left = limits.position.x*3
	#$Camera2D.limit_top = limits.position.y*3
	#$Camera2D.limit_right = limits.end.x*3
	#$Camera2D.limit_bottom = limits.end.y*3

func _physics_process(delta):
	$minimap_bg.position = $"../../../../player".position
	camera.global_position = $"../../..".position
	if $"../../../../unique" && $"../../../../unique".visible:
		$unique.visible = true
	
	
	
	if $"../../../../unique" && $unique.visible:
		rotate_to_unique($"../../../../unique", delta)
	rotate_to_rocket($"../../../../spawn_player", delta)
	#$"../pointer".rotate_toward($minimap_rocket.global_position)
	if !$"../../../../unique" or ($"../../../../unique" && !$"../../../../unique".visible):
		$unique.visible = false

func rotate_to_rocket(target, delta):
	var direction  = (target.global_position + Vector2(0,-150) - $"../../../../player".global_position)
	var angle = $"../pointer".transform.x.angle_to(direction )
	$"../pointer".rotate(sign(angle) * min(delta * 2, abs(angle)) )
	
	if direction.length() > 1200:
		$"../pointer".visible = true
	if direction.length() <= 1200:
		$"../pointer".visible = false

func rotate_to_unique(target, delta):
	var direction  = (target.global_position - $"../../../../player".global_position)
	var angle = $"../unique_pointer".transform.x.angle_to(direction)
	$"../unique_pointer".rotate(sign(angle) * min(delta * 200, abs(angle)) )
	
	if direction.length() > 500:
		$"../unique_pointer".visible = true
	if direction.length() <= 500:
		$"../unique_pointer".visible = false
