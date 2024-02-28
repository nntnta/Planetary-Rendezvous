extends Node2D

@onready var current_pos = $spawn_player
@export var orange_critter: PackedScene
@export var player: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	if $unique:
		$unique/coll_for_env/coll.disabled = true
	Transition.takeOffArea = true
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	orangeCritter_spawn()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.unique_jupiter_dropped && $unique:
		$unique.queue_free()
		
	if global.exp_jupiter >= 12 && $unique:
		$unique/coll_for_env/coll.disabled = false
		$unique.visible = true

func orangeCritter_spawn():
	var i = 0
	while  i < 12:
		var critter_spawner = orange_critter.instantiate()
		critter_spawner.position = Vector2i(randi_range(-400,600),randi_range(-200,1000))
		get_tree().current_scene.call_deferred('add_child', critter_spawner)
		i += 1

func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true


func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false
