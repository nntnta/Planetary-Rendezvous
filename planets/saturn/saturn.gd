extends Node2D

@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var green_critter: PackedScene
var player_in = false
var deflected_dead = 0
#var banana_summoned = false
var can_be_picked = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if $unique:
		$unique/coll_for_env/coll.disabled = true
	
	if !global.banana_shooter_drop:
		deflected_dead = 8
		$natural_drops/altar/banana.visible = false
		
	if !global.banana_summoned && global.banana_shooter_drop:
		deflected_dead = 0
		$natural_drops/altar/leaves.visible = false
		$natural_drops/altar/banana.visible = false
	if global.banana_summoned:
		$AnimationPlayer.play('banana_summoned')
		$AnimationPlayer.queue('idle')
		deflected_dead = 8
	Transition.takeOffArea = false
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	greenCritter_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.unique_saturn_dropped && $unique:
		$unique.queue_free()
	
	if global.exp_saturn >= 14 && $unique:
		$unique/coll_for_env/coll.disabled = false
		$unique.visible = true
	
	if deflected_dead > 0:
		$natural_drops/altar/leaves.visible = true
	leaf_check()
	
	if deflected_dead == 8 && !global.banana_summoned && global.banana_shooter_drop:
		global.banana_summoned = true
		$AnimationPlayer.play('banana_summoned')
		$AnimationPlayer.queue('idle')
	
func greenCritter_spawn():
	var i = 0
	while  i < 11:
		var critter_spawner = green_critter.instantiate()
		critter_spawner.position = Vector2i(randi_range(800, 1200),randi_range(0,600))
		get_tree().current_scene.call_deferred('add_child', critter_spawner)
		i += 1
		

func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true
		$spawn_player/area.frame_coords = Vector2(0,1)


func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false
		$spawn_player/area.frame_coords = Vector2(0,0)

func leaf_check():
	match deflected_dead:
		1:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,0)
		2:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,1)
		3:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,2)
		4:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,3)
		5:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,4)
		6:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,5)
		7:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,6)
		8:
			$natural_drops/altar/leaves.frame_coords = Vector2(0,7)

func _input(event):
	if (event.is_action_pressed("rightClick") or event.is_action_pressed("spaceBar")) && can_be_picked && player_in && global.banana_summoned: 
		player_in = false
		$AnimationPlayer.play('pop_up')
		

func _on_grab_box_area_entered(area):
	if area.is_in_group('player') && can_be_picked:
		$natural_drops/altar/banana.frame_coords = Vector2(1,1)
		player_in = true


func _on_grab_box_area_exited(area):
	if area.is_in_group('player') && can_be_picked:
		$natural_drops/altar/banana.frame_coords = Vector2(1,0)
		player_in = false

func pickable():
	can_be_picked = true

func banana_dropped():
	global.banana_summoned = false
	global.banana_shooter_drop = false


func _on_exit_area_area_entered(area):
	if area.is_in_group('player'):
		Transition.exit_rocket()
