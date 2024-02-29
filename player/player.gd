extends CharacterBody2D

var SPEED = 20000
var swing = false
var dead = false
var shot = false
@export var retry : PackedScene
@export var bullet: PackedScene
#var melee_dmg = 1

func _ready():
	$minimap/SubViewportContainer/AnimationPlayer.play('pointer')
	dead = false
	$tools/pickaxe/hitbox/coll.disabled = true
	$tools/pickaxe/pickaxe.visible = false
	$tools/melee_weapon/hitbox_melee/coll.disabled = true
	$tools/melee_weapon/frostblade.visible = false
	#global.silver_pickaxe_drop = false

func _process(_delta):
	if !dead && global.hp <= 0:
		dead = true
		$AnimationTree.get("parameters/playback").travel("dead")
		#$AnimationPlayer.play('dead')
	#camera_border(get_parent().editor_description)
	if global.minimap_dropped:
		$minimap.visible = true
	if !global.minimap_dropped:
		$minimap.visible = false

func _physics_process(delta):
	velocity  = Input.get_vector("a",'d','w','s') * (SPEED + global.extra_speed) * delta
	#pickaxeCollHidden()
	#if !global.frostblade_drop:
		#melee_dmg = 2
		#anim_frostblade_change('swingMeleeDown')
		#anim_frostblade_change('swingMeleeLeft')
		#anim_frostblade_change('swingMeleeRight')
		#anim_frostblade_change('swingMeleeUp')
		
	if velocity == Vector2.ZERO && !swing && !dead:
		$AnimationTree.get("parameters/playback").travel("idle")
	
	elif !swing && !dead:
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
	if event.is_action_pressed("leftClick", false) && !swing && !global.bronze_pickaxe_drop && global.slot == 'inv1' && !dead:
		$AnimationTree.set("parameters/swingPickaxe/blend_position", global_position.direction_to(get_global_mouse_position()))
		$AnimationTree.set("parameters/idle/blend_position", global_position.direction_to(get_global_mouse_position()))
		swing = true
		$AnimationTree.get("parameters/playback").travel("swingPickaxe")
		
	if event.is_action_pressed("leftClick", false) && !dead && !swing && (!global.basic_baton_drop or !global.frostblade_drop ) && global.slot == 'inv2':
		$AnimationTree.set("parameters/swingMelee/blend_position", global_position.direction_to(get_global_mouse_position()))
		$AnimationTree.set("parameters/idle/blend_position", global_position.direction_to(get_global_mouse_position()))
		swing = true
		$AnimationTree.get("parameters/playback").travel("swingMelee")
	
	if event.is_action_pressed("leftClick", false) && (global.ammo > 0 or global.unlimited_ammo_dropped) && !dead && !shot && (!global.star_shooter_drop or !global.banana_shooter_drop ) && global.slot == 'inv3':
		global.ammo -= 1
		var bullet_spawner = bullet.instantiate()
		bullet_spawner.position = $sprite.global_position
		get_tree().current_scene.call_deferred('add_child', bullet_spawner)
		shot = true
		$tools/ranged_weapon/cd.start()
		
		
func end_swinging():
	swing = false
	


func _on_hitbox_area_entered(area):
	if area.is_in_group('enemy_attack') && !dead:
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
	

func anim_frostblade_change(name:String):
	var anim = $AnimationPlayer.get_animation(name)
	var index_frame_1 = anim.find_track('tools/melee_weapon/basicbaton:frame_coords',0)
	var index_frame_2 = anim.find_track('tools/melee_weapon/frostblade:frame_coords',0)
	var index_vis_1 = anim.find_track('tools/melee_weapon/basicbaton:visible',0)
	var index_vis_2 = anim.find_track('tools/melee_weapon/frostblade:visible',0)
	var index_z_1 = anim.find_track('tools/melee_weapon/basicbaton:z_index',0)
	var index_z_2 = anim.find_track('tools/melee_weapon/frostblade:z_index',0)
	anim.remove_track(index_frame_1)
	anim.track_set_enabled(index_frame_2, true)
	anim.remove_track(index_vis_1)
	anim.track_set_enabled(index_vis_2, true)
	anim.remove_track(index_z_1)
	anim.track_set_enabled(index_z_2, true)
	


func _on_invulnerable_timeout():
	$sprite.self_modulate = Color(1,1,1)


func _on_hitbox_melee_area_entered(area):
	if area.is_in_group('enemy'):
		area.get_parent().get_parent().hp -= global.melee_dmg

func camera_border(planet):
	match planet:
		"mercury":
			$Camera2D.limit_left	= -687
			$Camera2D.limit_top		= -946
			$Camera2D.limit_right	= 1848
			$Camera2D.limit_bottom	= 1595
		"venus":
			$Camera2D.limit_left	= -1328
			$Camera2D.limit_top		= -1566
			$Camera2D.limit_right	= 2480
			$Camera2D.limit_bottom	= 2224
		"earth":
			$Camera2D.limit_left	= -1328
			$Camera2D.limit_top		= -1566
			$Camera2D.limit_right	= 2480
			$Camera2D.limit_bottom	= 2224
		"mars":
			$Camera2D.limit_left	= -1328
			$Camera2D.limit_top		= -1566
			$Camera2D.limit_right	= 2480
			$Camera2D.limit_bottom	= 2224
		"jupiter":
			$Camera2D.limit_left	= -1954
			$Camera2D.limit_top		= -2216
			$Camera2D.limit_right	= 3114
			$Camera2D.limit_bottom	= 2864
		"saturn":
			$Camera2D.limit_left	= -1954
			$Camera2D.limit_top		= -2216
			$Camera2D.limit_right	= 3114
			$Camera2D.limit_bottom	= 2864
		"uranus":
			$Camera2D.limit_left	= -1328
			$Camera2D.limit_top		= -1566
			$Camera2D.limit_right	= 2480
			$Camera2D.limit_bottom	= 2224
		"neptune":
			$Camera2D.limit_left	= -1328
			$Camera2D.limit_top		= -1566
			$Camera2D.limit_right	= 2480
			$Camera2D.limit_bottom	= 2224
		"pluto":
			$Camera2D.limit_left	= -687
			$Camera2D.limit_top		= -946
			$Camera2D.limit_right	= 1848
			$Camera2D.limit_bottom	= 1595

func retry_scene():
	get_tree().change_scene_to_packed(retry)


func _on_cd_timeout():
	shot = false
