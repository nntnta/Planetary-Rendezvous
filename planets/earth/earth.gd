extends Node2D

@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var earth_mineral: PackedScene

var player_in = false
var mouse_in = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide_uniques()
	player_in = false
	Transition.takeOffArea = false
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	
	mineral_spawn()
	#print(self.editor_description)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_in:
		$stabilizer/sprite.frame_coords = Vector2(0,1)
	if !player_in:
		$stabilizer/sprite.frame_coords = Vector2(0,0)

func _input(event):
	if (event.is_action_pressed("rightClick") or event.is_action_pressed("spaceBar")) && player_in && global.unique_all_planets:
		player_in = false
		$AnimationPlayer.play('unique_offered')
	elif (event.is_action_pressed("rightClick") or event.is_action_pressed("spaceBar")) && player_in:
		$stabilizer/Label.visible = true
		$stabilizer/Timer.start()
		
func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true
		$spawn_player/area.frame_coords = Vector2(0,1)
		

func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false
		$spawn_player/area.frame_coords = Vector2(0,0)

func mineral_spawn():
	var i = 0
	while  i < 16:
		var mineral_spawner = earth_mineral.instantiate()
		mineral_spawner.position = Vector2i(randi_range(650, 1200),randi_range(50,1100))
		get_tree().current_scene.call_deferred('add_child', mineral_spawner)
		i += 1


func _on_interact_area_entered(area):
	if area.is_in_group('player'):
		player_in = true

func _on_interact_area_exited(area):
	if area.is_in_group('player'):
		player_in = false

func hide_uniques():
	$stabilizer/uniques/unique1.visible = false
	$stabilizer/uniques/unique2.visible = false
	$stabilizer/uniques/unique3.visible = false
	$stabilizer/uniques/unique4.visible = false
	$stabilizer/uniques/unique5.visible = false
	$stabilizer/uniques/unique6.visible = false
	$stabilizer/uniques/unique7.visible = false
	$stabilizer/uniques/unique8.visible = false

func ending():
	Transition.good_ending()


func _on_exit_area_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false
		Transition.exit_rocket()


func _on_timer_timeout():
	$stabilizer/Label.visible = false
