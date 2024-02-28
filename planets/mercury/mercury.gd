extends Node2D

@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var mercury_mineral: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	if $unique:
		$unique/coll_for_env/coll.disabled = true
	Transition.takeOffArea = false
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	mineral_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.unique_mercury_dropped && $unique:
		$unique.queue_free()
		
	if global.exp_mercury >= 5 && $unique:
		$unique/coll_for_env/coll.disabled = false
		$unique.visible = true

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
	while  i < 15:
		var mineral_spawner = mercury_mineral.instantiate()
		mineral_spawner.position = Vector2i(randi_range(-50,1400),randi_range(270,1000))
		get_tree().current_scene.call_deferred('add_child', mineral_spawner)
		i += 1


func _on_exit_area_area_entered(area):
	if area.is_in_group('player'):
		Transition.exit_rocket()
