extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$status.visible = false




func _on_grab_box_area_entered(area):
	if area.is_in_group('player'):
		var ID = '1'
		global.unlimited_ammo_dropped = true
		$"../player/player_interface/inventory/UI/inv_grid".add_item(ID)
		$AnimationPlayer.play('status')
