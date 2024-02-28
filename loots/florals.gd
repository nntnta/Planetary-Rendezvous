extends Area2D

var shiny = false
var dropped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$heal_update.visible = false
	if randi_range(0,100) < 8+global.exp_mars && global.shiny_floral == false && global.healing_factor_dropped == false:
		shiny = true
		global.shiny_floral = true
		$AnimationPlayer.play('idle_shiny')
	else:
		$AnimationPlayer.play('idle')
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	if area.is_in_group('pickaxe') && !dropped:
		$AnimationPlayer.play('gettingHit')
		
	if area.is_in_group('player') && dropped:
		if shiny:
			var ID = '0'
			global.healing_factor_dropped = true
			$"../player/player_interface/inventory/UI/inv_grid".add_item(ID)
			#get_parent().find_child("inv_grid").add_item(ID)
		if global.hp < global.max_hp:
			global.hp += 1
		$Sprite2D.visible = false
		$AnimationPlayer.play('heal')
		#queue_free()

func drops():
	$coll_for_env.queue_free()
	if shiny:
		global.exp_venus += 5
		dropped = true
		$Sprite2D.scale = Vector2(0.25,0.25)
		$Sprite2D.frame_coords = Vector2(1,2)
		
	else:
		dropped = true
		$Sprite2D.scale = Vector2(0.25,0.25)
		$Sprite2D.frame_coords = Vector2(0,2)
		
