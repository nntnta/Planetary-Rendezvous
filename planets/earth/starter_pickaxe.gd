extends Node2D
var player_in = false
var mouseIn = false
# Called when the node enters the scene tree for the first time.
func _ready():
	player_in = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in:
		$hover.visible = true
	
	if !player_in:
		$hover.visible = false


func _on_grab_box_area_entered(area):
	if area.is_in_group('player'):
		player_in = true
		
func _on_grab_box_area_exited(area):
	if area.is_in_group('player'):
		player_in = false


func _input(event):
	if event.is_action_pressed("rightClick") && player_in:
		$"../../player_interface/inv/inv1/inv_1".visible = true
		queue_free()

func _on_grab_box_mouse_entered():
	mouseIn = true


func _on_grab_box_mouse_exited():
	mouseIn = false
