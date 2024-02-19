extends Area2D

var shiny = false
var dropped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if randi_range(0,100) < 10 && global.shiny_floral == false && global.healing_factor_dropped == false:
		shiny = true
		global.shiny_floral = true
		$AnimationPlayer.play('idle_shiny')
	else:
		$AnimationPlayer.play('idle')
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	if area.is_in_group('pickaxe'):
		$AnimationPlayer.play('gettingHit')
		
	if area.is_in_group('player') && dropped:
		if shiny:
			var ID = '0'
			global.healing_factor_dropped = true
			get_parent().find_child("inv_grid").add_item(ID)
		queue_free()

func drops():
	$coll_for_env.queue_free()
	if shiny:
		dropped = true
		$Sprite2D.frame_coords = Vector2(1,2)
		$Sprite2D.scale = Vector2(0.25,0.25)
	else:
		dropped = true
		$Sprite2D.frame_coords = Vector2(0,2)
		$Sprite2D.scale = Vector2(0.25,0.25)
