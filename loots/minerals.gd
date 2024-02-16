extends Area2D
var mineral_hp = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$drops.monitoring = false
	
	if get_parent().editor_description == 'mercury':
		$mineral.region_rect = Rect2(160,0,160,160)
		
	if get_parent().editor_description == 'venus':
		$mineral.region_rect = Rect2(480,0,160,160)
	
	if get_parent().editor_description == 'earth':
		$mineral.region_rect = Rect2(0,0,160,160)
	
	if get_parent().editor_description == 'mars':
		$mineral.region_rect = Rect2(320,0,160,160)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group('pickaxe'):
		if mineral_hp == 3:
			$mineral.region_rect.position.y = 160
			$mineral.region_rect.size.y = 160
			mineral_hp -= 1
			
		elif mineral_hp == 2:
			$mineral.region_rect.position.y = 320
			$mineral.region_rect.size.y = 160
			mineral_hp -= 1
			
		elif mineral_hp == 1:
			$coll.disabled = true
			$drops.monitoring = true
			$mineral.region_rect.position.y = 480
			$mineral.region_rect.size.y = 160
		


func _on_drops_area_entered(area):
	if area.is_in_group('player'):
		queue_free()
