extends Node2D

@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var catepillar: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	if $unique:
		$unique/coll_for_env/coll.disabled = true
	global.exp_pluto = 10
	Transition.takeOffArea = false
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	
	if !global.catepillar_dead:
		catepillar_spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.unique_pluto_dropped && $unique:
		$unique.queue_free()
	
	if global.exp_pluto >= 10 && $unique:
		$unique/coll_for_env/coll.disabled = false
		$unique.visible = true

func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true


func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false

func catepillar_spawn():
	var catepillar_spawner = catepillar.instantiate()
	catepillar_spawner.position = Vector2i(randi_range(-100, 300),randi_range(-450,-250))
	get_tree().current_scene.call_deferred('add_child', catepillar_spawner)


func _on_exit_area_area_entered(area):
	if area.is_in_group('player'):
		Transition.exit_rocket()
