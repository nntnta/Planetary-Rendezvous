extends Node2D
var hp = 10
var blade_dropped = false
var player_in = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in && blade_dropped:
		$hitbox/sprite.frame_coords = Vector2(0,4)
	
	if !player_in && blade_dropped:
		$hitbox/sprite.frame_coords = Vector2(0,3)


func _on_hitbox_area_entered(area):
	if area.is_in_group('pickaxe') && !global.silver_pickaxe_drop:
		hp -= 2
		if hp == 6:
			$hitbox/sprite.frame_coords = Vector2(0,1)
		if hp == 2:
			$hitbox/sprite.frame_coords = Vector2(0,2)
		if hp <= 0 && !blade_dropped:
			#if !blade_dropped:
				#$coll_for_env.queue_free()
			$hitbox/sprite.frame_coords = Vector2(0,3)
			$hitbox/sprite.rotation = PI/4
			$AnimationPlayer.play('idle')
			blade_dropped = true
			
	if area.is_in_group('pickaxe') && global.silver_pickaxe_drop:
		$AnimationPlayer.play('cant_break')



func _input(event):
	if (event.is_action_pressed("rightClick") or event.is_action_pressed("leftClick") or event.is_action_pressed("spaceBar")) && player_in && blade_dropped: 
		player_in = false
		global.frostblade_drop = false
		global.exp_uranus += 10
		global.melee_dmg += 2
		$"../player".anim_frostblade_change('swingMeleeDown')
		$"../player".anim_frostblade_change('swingMeleeLeft')
		$"../player".anim_frostblade_change('swingMeleeRight')
		$"../player".anim_frostblade_change('swingMeleeUp')
		
		$coll_for_env/coll.disabled = true
		$coll_for_env/coll2.disabled = true
		$AnimationPlayer.play('pop_up')

func _on_grab_box_area_entered(area):
	if area.is_in_group('player'):
		player_in = true
		


func _on_grab_box_area_exited(area):
	if area.is_in_group('player'):
		player_in = false
		
