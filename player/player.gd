extends CharacterBody2D

var SPEED = 15000.0 
var swing = false
var melee_dmg = 0

func _ready():
	$tools/pickaxe/hitbox/coll.disabled = true
	$tools/pickaxe/pickaxe.visible = false
	$tools/melee_weapon/hitbox_melee/coll.disabled = true
	$tools/melee_weapon/frostblade.visible = false
	#global.silver_pickaxe_drop = false

func _physics_process(delta):
	velocity  = Input.get_vector("a",'d','w','s') * (SPEED + global.extra_speed) * delta
	#pickaxeCollHidden()
	if !global.frostblade_drop:
		melee_dmg = 2
	
	if velocity == Vector2.ZERO && !swing:
		$AnimationTree.get("parameters/playback").travel("idle")
	
	elif !swing:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", velocity)
		$AnimationTree.set("parameters/walk/blend_position", velocity)
		
		move_and_slide()
	#pickaxe upgrades below
	if !global.silver_pickaxe_drop:
		#$tools/pickaxe/pickaxe.frame_coords = Vector2i(2,3)
		anim_silver_change('swingPickaxeDown')
		anim_silver_change('swingPickaxeLeft')
		anim_silver_change('swingPickaxeRight')
		anim_silver_change('swingPickaxeUp')

	
func _input(event):
	if event.is_action_pressed("leftClick", false) && !swing && !global.bronze_pickaxe_drop && global.slot == 'inv1':
		$AnimationTree.set("parameters/swingPickaxe/blend_position", global_position.direction_to(get_global_mouse_position()))
		$AnimationTree.set("parameters/idle/blend_position", global_position.direction_to(get_global_mouse_position()))
		swing = true
		$AnimationTree.get("parameters/playback").travel("swingPickaxe")
		
	if event.is_action_pressed("leftClick", false) && !swing && !global.frostblade_drop && global.slot == 'inv2':
		$AnimationTree.set("parameters/swingMelee/blend_position", global_position.direction_to(get_global_mouse_position()))
		$AnimationTree.set("parameters/idle/blend_position", global_position.direction_to(get_global_mouse_position()))
		swing = true
		$AnimationTree.get("parameters/playback").travel("swingMelee")
		
		
func end_swinging():
	swing = false
	


func _on_hitbox_area_entered(area):
	if area.is_in_group('enemy_attack'):
		if $sprite.self_modulate == Color(1,1,1):
			global.hp -= 1
			$sprite.self_modulate = Color(100,100,100)
			$hitbox/invulnerable.start()
		
		

func pickaxeCollHidden():
	if !$tools/pickaxe/pickaxe.visible:
		$tools/pickaxe/hitbox/coll.disabled = true
	if $tools/pickaxe/pickaxe.visible:
		$tools/pickaxe/hitbox/coll.disabled = false

func anim_silver_change(name:String):
	var anim = $AnimationPlayer.get_animation(name)
	var index_frame_1 = anim.find_track('tools/pickaxe/pickaxe:frame_coords',0)
	var index_frame_2 = anim.find_track('tools/pickaxe/pickaxe_silver:frame_coords',0)
	var index_vis_1 = anim.find_track('tools/pickaxe/pickaxe:visible',0)
	var index_vis_2 = anim.find_track('tools/pickaxe/pickaxe_silver:visible',0)
	anim.remove_track(index_frame_1)
	anim.track_set_enabled(index_frame_2, true)
	anim.remove_track(index_vis_1)
	anim.track_set_enabled(index_vis_2, true)
	
	


func _on_invulnerable_timeout():
	$sprite.self_modulate = Color(1,1,1)


func _on_hitbox_melee_area_entered(area):
	if area.is_in_group('enemy'):
		area.get_parent().get_parent().hp -= melee_dmg
