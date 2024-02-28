extends Node2D
var infinite = load("res://pics/player/bars/ammo_bar_infinite.png")
var inv1 = false
var inv2 = false
var inv3 = false
var find_unique = 'The unique resource has shown itself. Get ahold of it.'
var lack_exp  = 'Gather more EXP on the planet.'
var offering = 'Offer all uniques to the altar on Earth.'
var lack_offer = 'Gather all the unique resource from other planets.'
var unique_got = 'The unique resource is acquired.'
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
	
	#$ammoBar/ammo.text = str($ammoBar.value) + ' / ' + str($ammoBar.max_value)
	$hpBar/hp.text = str(global.hp) + ' / ' + str(global.max_hp)
	
	if global.exp_mercury > 0:
		$status/speed.visible = true
		$status/speed_text.text = 'Speed: '+str(global.exp_mercury)
	if global.exp_venus > 0:
		$status/melee_dmg.visible = true
		$status/melee_text.text = 'Attack DMG: '+str(global.exp_venus)
	if global.exp_earth > 0:
		$status/max_health.visible = true
		$status/maxHp_text.text = 'Extra HP: '+str(global.exp_earth)
	if global.exp_mars > 0:
		$status/luck.visible = true
		$status/luck_text.text = 'Luck: '+str(global.exp_mars)
	if global.exp_jupiter > 0:
		$status/ammo.visible = true
		$status/ammo_text.text = 'Ammo Cap: '+str(global.exp_jupiter)
		
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
	if event.is_action_pressed("1") or global.slot == 'inv1' or inv1:
		global.slot = 'inv1'
		inv1 = true
		inv2 = false
		inv3 = false
		$inv/inv1/inv_1_selected.visible = true
		$inv/inv2/inv_2_selected.visible = false
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("2") or global.slot == 'inv2' or inv2:
		global.slot = 'inv2'
		inv1 = false
		inv2 = true
		inv3 = false
		$inv/inv1/inv_1_selected.visible = false
		$inv/inv2/inv_2_selected.visible = true
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("3") or global.slot == 'inv3' or inv3:
		global.slot = 'inv3'
		inv1 = false
		inv2 = false
		inv3 = true
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
	#$ammoBar/ammo.visible = true
	pass


func _on_ammo_bar_mouse_exited():
	#$ammoBar/ammo.visible = false
	pass


func _on_speed_mouse_entered():
	if global.exp_mercury > 0:
		$status/speed_text.visible = true


func _on_speed_mouse_exited():
	$status/speed_text.visible = false


func _on_melee_dmg_mouse_entered():
	if global.exp_venus > 0:
		$status/melee_text.visible = true


func _on_melee_dmg_mouse_exited():
	$status/melee_text.visible = false


func _on_max_health_mouse_entered():
	if global.exp_earth > 0:
		$status/maxHp_text.visible = true


func _on_max_health_mouse_exited():
	$status/maxHp_text.visible = false


func _on_luck_mouse_entered():
	if global.exp_mars > 0:
		$status/luck_text.visible = true


func _on_luck_mouse_exited():
	$status/luck_text.visible = false


func _on_ammo_mouse_entered():
	if global.exp_jupiter > 0:
		$status/ammo_text.visible = true


func _on_ammo_mouse_exited():
	$status/ammo_text.visible = false



func _on_button_1_pressed():
	inv1 = true
	inv2 = false
	inv3 = false
	global.slot = 'inv1'


func _on_button_2_pressed():
	inv1 = false
	inv2 = true
	inv3 = false
	global.slot = 'inv2'


func _on_button_3_pressed():
	global.slot = 'inv3'
	inv1 = false
	inv2 = false
	inv3 = true


func _on_mercury_mouse_entered():
	if $exp/mercury.value >= $exp/mercury.max_value && !global.unique_mercury_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_mercury_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp
		
func _on_mercury_mouse_exited():
	$exp/done.visible = false


func _on_venus_mouse_entered():
	if $exp/venus.value >= $exp/venus.max_value && !global.unique_venus_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_venus_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp
		
func _on_venus_mouse_exited():
	$exp/done.visible = false


func _on_mars_mouse_entered():
	if $exp/mars.value >= $exp/mars.max_value && !global.unique_mars_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_mars_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp

func _on_mars_mouse_exited():
	$exp/done.visible = false


func _on_jupiter_mouse_entered():
	if $exp/jupiter.value >= $exp/jupiter.max_value && !global.unique_jupiter_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_jupiter_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp

func _on_jupiter_mouse_exited():
	$exp/done.visible = false


func _on_saturn_mouse_entered():
	if $exp/saturn.value >= $exp/saturn.max_value && !global.unique_saturn_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_saturn_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp

func _on_saturn_mouse_exited():
	$exp/done.visible = false


func _on_uranus_mouse_entered():
	if $exp/uranus.value >= $exp/uranus.max_value && !global.unique_uranus_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_uranus_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp

func _on_uranus_mouse_exited():
	$exp/done.visible = false



func _on_neptune_mouse_entered():
	if $exp/neptune.value >= $exp/neptune.max_value && !global.unique_neptune_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_neptune_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp

func _on_neptune_mouse_exited():
	$exp/done.visible = false


func _on_pluto_mouse_entered():
	if $exp/pluto.value >= $exp/pluto.max_value && !global.unique_pluto_dropped:
		$exp/done.visible = true
		$exp/done.text = find_unique
	elif global.unique_pluto_dropped:
		$exp/done.visible = true
		$exp/done.text = unique_got
	else:
		$exp/done.visible = true
		$exp/done.text = lack_exp

func _on_pluto_mouse_exited():
	$exp/done.visible = false


func _on_earth_mouse_entered():
	if global.unique_all_planets:
		$exp/done.visible = true
		$exp/done.text = offering
	else:
		$exp/done.visible = true
		$exp/done.text = lack_offer


func _on_earth_mouse_exited():
	$exp/done.visible = false
