extends Area2D
var mineral_hp = 4
var pickaxe_dmg = 1
var ID = '0'
# Called when the node enters the scene tree for the first time.
func _ready():
	$status_upgrade.visible = false
	$drops.monitoring = false
	
	if get_parent().editor_description == 'mercury':
		ID = '0'
		$mineral.region_rect = Rect2(160,0,160,160)
		
	if get_parent().editor_description == 'venus':
		ID = '1'
		$mineral.region_rect = Rect2(480,0,160,160)
	
	if get_parent().editor_description == 'earth':
		ID = '2'
		$mineral.region_rect = Rect2(0,0,160,160)
	
	if get_parent().editor_description == 'mars':
		ID = '3'
		$mineral.region_rect = Rect2(320,0,160,160)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !global.silver_pickaxe_drop:
		pickaxe_dmg = 2

func _on_area_entered(area):
	if area.is_in_group('pickaxe'):
		mineral_hp -= pickaxe_dmg
		if mineral_hp == 3:
			$mineral.region_rect.position.y = 160
			$mineral.region_rect.size.y = 160
			#mineral_hp -= pickaxe_dmg
			
		elif mineral_hp == 2:
			$mineral.region_rect.position.y = 320
			$mineral.region_rect.size.y = 160
			#mineral_hp -= pickaxe_dmg
			
		elif mineral_hp <= 1:
			$coll.disabled = true
			if $drops.monitoring == false:
				$coll_for_env.queue_free()
			$drops.monitoring = true
			$mineral.region_rect.position.y = 480
			$mineral.region_rect.size.y = 160
			#mineral_hp -= pickaxe_dmg
			
		
		


func _on_drops_area_entered(area):
	if area.is_in_group('player'):
		match ID:
			'0':
				global.exp_mercury += 1
				$mineral.visible = false
				$AnimationPlayer.play('speed')
				#if global.mineral_mercury > 4:
					#print(global.mineral_mercury)
			'1':
				global.exp_venus += 1
				global.melee_dmg += 0.1
				$mineral.visible = false
				$AnimationPlayer.play('damage')
				#if global.mineral_venus > 4:
					#print(global.mineral_venus)
			'2':
				global.exp_earth += 1
				global.hp += 1
				$mineral.visible = false
				$AnimationPlayer.play('max_hp')
				#if global.mineral_earth > 4:
					#print(global.mineral_earth)
			'3':
				global.exp_mars += 1
				$mineral.visible = false
				$AnimationPlayer.play('luck')
				#if global.mineral_mars > 4:
					#print(global.mineral_mars)
		#queue_free()
