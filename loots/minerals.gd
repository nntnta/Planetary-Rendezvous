extends Area2D
var mineral_hp = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().editor_description == 'mercury':
		$mineral.region_rect = Rect2(180,30,120,110)
		
	if get_parent().editor_description == 'venus':
		$mineral.region_rect = Rect2(500,30,120,110)
	
	if get_parent().editor_description == 'earth':
		$mineral.region_rect = Rect2(20,30,120,110)
	
	if get_parent().editor_description == 'mars':
		$mineral.region_rect = Rect2(340,30,120,110)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group('pickaxe'):
		if mineral_hp == 2:
			$mineral.region_rect.position.y = 200
			$mineral.region_rect.size.y = 100
			mineral_hp -= 1
			
		elif mineral_hp == 1:
			$mineral.region_rect.position.y = 380
			$mineral.region_rect.size.y = 80
			mineral_hp -= 1
			
		elif mineral_hp == 0:
			queue_free()
