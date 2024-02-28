extends Node2D

@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var venus_mineral: PackedScene
@export var venus_healPlant: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	if $unique:
		$unique/coll_for_env/coll.disabled = true
	Transition.takeOffArea = true
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	mineral_spawn()
	healPlant_spawn()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.unique_venus_dropped && $unique:
		$unique.queue_free()
	
	if global.exp_venus >= 5 && $unique:
		$unique/coll_for_env/coll.disabled = false
		$unique.visible = true


func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true


func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false

func mineral_spawn():
	var i = 0
	while  i < 12:
		var mineral_spawner = venus_mineral.instantiate()
		mineral_spawner.position = Vector2i(randi_range(750,1850),randi_range(-200,1200))
		get_tree().current_scene.call_deferred('add_child', mineral_spawner)
		i += 1

func healPlant_spawn():
	var i = 0
	while  i < 6:
		var heal_spawner = venus_healPlant.instantiate()
		heal_spawner.position = Vector2i(randi_range(180,1200),randi_range(220,1000))
		get_tree().current_scene.call_deferred('add_child', heal_spawner)
		i += 1
		
