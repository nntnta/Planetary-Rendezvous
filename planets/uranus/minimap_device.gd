extends Node2D
var player_in = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player_in = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in:
		$hover.visible = true
	
	if !player_in:
		$hover.visible = false
	
	if global.minimap_dropped:
		queue_free()
		

func _input(event):
	if (event.is_action_pressed("rightClick") or event.is_action_pressed("spaceBar") or event.is_action_pressed("leftClick")) && player_in:
		global.unlocked_jupiter = true
		global.unlocked_mercury = true
		global.unlocked_venus = true
		#global.unlocked_saturn = true
		#global.unlocked_uranus = true
		#global.unlocked_neptune = true
		player_in = false
		$coll_env/coll.disabled = true
		$AnimationPlayer.play('pop_up')
		

func _on_grab_box_area_entered(area):
	if area.is_in_group('player'):
		player_in = true


func _on_grab_box_area_exited(area):
	if area.is_in_group('player'):
		player_in = false
		
func picked():
	global.minimap_dropped = true