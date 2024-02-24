extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	global.slot = 'inv1'
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$hpBar.value = global.hp
	$hpBar.max_value = global.max_hp
	
	if !global.bronze_pickaxe_drop:
		$inv/inv1/inv_1.visible = true
		$inv/inv1/inv_1.region_rect = Rect2(160,480,160,160) #bronze pickaxe
	if !global.silver_pickaxe_drop:
		$inv/inv1/inv_1.visible = true
		$inv/inv1/inv_1.region_rect = Rect2(320,480,160,160)
		
	if !global.frostblade_drop:
		$inv/inv2/inv_2.visible = true
		$inv/inv2/inv_2.region_rect = Rect2(0,0,160,160)

func _input(event):
	if event.is_action_pressed("1"):
		global.slot = 'inv1'
		$inv/inv1/inv_1_selected.visible = true
		$inv/inv2/inv_2_selected.visible = false
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("2"):
		global.slot = 'inv2'
		$inv/inv1/inv_1_selected.visible = false
		$inv/inv2/inv_2_selected.visible = true
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("3"):
		global.slot = 'inv3'
		$inv/inv1/inv_1_selected.visible = false
		$inv/inv2/inv_2_selected.visible = false
		$inv/inv3/inv_3_selected.visible = true
