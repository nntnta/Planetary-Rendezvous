extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !global.bronze_pickaxe_drop:
		$inv/inv1/inv_1.visible = true
		$inv/inv1/inv_1.region_rect = Rect2(180,500,120,120) #bronze pickaxe


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
