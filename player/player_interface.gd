extends Node2D
var infinite = load("res://pics/player/bars/ammo_bar_infinite.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	$hpBar/hp.visible = false
	$ammoBar/ammo.visible = false
	$ammoBar.visible = false
	#global.slot = 'inv1'
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_position = $"../Camera2D".global_position
	$hpBar.value = global.hp
	$hpBar.max_value = global.max_hp
	$ammoBar.value = global.ammo
	$ammoBar.max_value = global.max_ammo
	update_exp_progress()
	
	$ammoBar/ammo.text = str($ammoBar.value) + ' / ' + str($ammoBar.max_value)
	$hpBar/hp.text = str($hpBar.value) + ' / ' + str($hpBar.max_value)
	
	if !global.star_shooter_drop or !global.banana_shooter_drop:
		$ammoBar.visible = true
	
	if !global.bronze_pickaxe_drop:
		$inv/inv1/inv_1.visible = true
		$inv/inv1/inv_1.region_rect = Rect2(160,480,160,160) #bronze pickaxe
		#$AnimationPlayer.play("just_got_inv1")
	if !global.silver_pickaxe_drop:
		$inv/inv1/inv_1.visible = true
		$inv/inv1/inv_1.region_rect = Rect2(320,480,160,160)
		#$AnimationPlayer.play("just_got_inv1")
		
	# INV 2 for melee weapons !!!!
	
	if !global.basic_baton_drop:
		$inv/inv2/inv_2.visible = true
		$inv/inv2/inv_2.frame_coords = Vector2(1,0)
		#$AnimationPlayer.play("just_got_inv2")
	if !global.frostblade_drop:
		$inv/inv2/inv_2.visible = true
		$inv/inv2/inv_2.frame_coords = Vector2(0,0)
		#$AnimationPlayer.play("just_got_inv2")
		
	if !global.star_shooter_drop:
		$inv/inv3/inv_3.visible = true
		$inv/inv3/inv_3.frame_coords = Vector2(0,0)
	if !global.banana_shooter_drop:
		$inv/inv3/inv_3.visible = true
		$inv/inv3/inv_3.frame_coords = Vector2(1,0)
		
	if global.unlimited_ammo_dropped:
		$ammoBar.texture_over = infinite
		
func _input(event):
	if event.is_action_pressed("1") or global.slot == 'inv1':
		global.slot = 'inv1'
		$inv/inv1/inv_1_selected.visible = true
		$inv/inv2/inv_2_selected.visible = false
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("2") or global.slot == 'inv2':
		global.slot = 'inv2'
		$inv/inv1/inv_1_selected.visible = false
		$inv/inv2/inv_2_selected.visible = true
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("3") or global.slot == 'inv3':
		global.slot = 'inv3'
		$inv/inv1/inv_1_selected.visible = false
		$inv/inv2/inv_2_selected.visible = false
		$inv/inv3/inv_3_selected.visible = true


func _on_hp_bar_mouse_entered():
	$hpBar/hp.visible = true


func _on_hp_bar_mouse_exited():
	$hpBar/hp.visible = false
	
func update_exp_progress():
	$exp/mercury.value = global.exp_mercury
	$exp/venus.value = global.exp_venus
	$exp/earth.value = global.exp_earth
	$exp/mars.value = global.exp_mars
	$exp/jupiter.value = global.exp_jupiter
	$exp/saturn.value = global.exp_saturn
	$exp/uranus.value = global.exp_uranus
	$exp/neptune.value = global.exp_neptune
	$exp/pluto.value = global.exp_pluto


func _on_ammo_bar_mouse_entered():
	$ammoBar/ammo.visible = true


func _on_ammo_bar_mouse_exited():
	$ammoBar/ammo.visible = false
