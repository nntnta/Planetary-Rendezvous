extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("1"):
		$inv/inv1/inv_1_selected.visible = true
		$inv/inv2/inv_2_selected.visible = false
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("2"):
		$inv/inv1/inv_1_selected.visible = false
		$inv/inv2/inv_2_selected.visible = true
		$inv/inv3/inv_3_selected.visible = false
	
	if event.is_action_pressed("3"):
		$inv/inv1/inv_1_selected.visible = false
		$inv/inv2/inv_2_selected.visible = false
		$inv/inv3/inv_3_selected.visible = true
