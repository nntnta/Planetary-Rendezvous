extends Node2D
var x = 0
var y = 0
var player_in = false
var current_planet = ''
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play('idle')
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match get_parent().editor_description:
		'mercury' :
			current_planet = 'mercury'
			$sprite.frame_coords = Vector2(0,0+y)
		'venus' :
			current_planet = 'venus'
			$sprite.frame_coords = Vector2(1,0+y)
		'mars' :
			current_planet = 'mars'
			$sprite.frame_coords = Vector2(2,0+y)
		'jupiter' :
			current_planet = 'jupiter'
			$sprite.frame_coords = Vector2(3,0+y)
		'saturn' :
			current_planet = 'saturn'
			$sprite.frame_coords = Vector2(0,1+y)
		'uranus' :
			current_planet = 'uranus'
			$sprite.frame_coords = Vector2(1,1+y)
		'neptune' :
			current_planet = 'neptune'
			$sprite.frame_coords = Vector2(2,1+y)
		'pluto' :
			current_planet = 'pluto'
			$sprite.frame_coords = Vector2(3,1+y)

func _input(event):
	if (event.is_action_pressed("rightClick") or event.is_action_pressed("spaceBar")) && player_in:
		player_in = false
		
		$coll_for_env/coll.disabled = true
		$AnimationPlayer.play('pop_up')

func _on_grab_box_area_entered(area):
	if area.is_in_group('player'):
		y= 2
		player_in = true

func _on_grab_box_area_exited(area):
	if area.is_in_group('player'):
		y= 0
		player_in = false

func picked():
	$"../player/player_interface/inventory/UI/inv_grid".add_item(current_planet)
	match current_planet:
		'mercury' :
			global.unique_mercury_dropped = true
		'venus' :
			global.unique_venus_dropped = true
		'mars' :
			global.unique_mars_dropped = true
		'jupiter' :
			global.unique_jupiter_dropped = true
		'saturn' :
			global.unique_saturn_dropped = true
		'uranus' :
			global.unique_uranus_dropped = true
		'neptune' :
			global.unique_neptune_dropped = true
		'pluto' :
			global.unique_pluto_dropped = true
