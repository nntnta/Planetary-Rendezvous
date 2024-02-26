extends Node2D

@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var green_critter: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	Transition.takeOffArea = true
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	greenCritter_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func greenCritter_spawn():
	var i = 0
	while  i < 8:
		var critter_spawner = green_critter.instantiate()
		critter_spawner.position = Vector2i(randi_range(700, 1300),randi_range(0,700))
		get_tree().current_scene.call_deferred('add_child', critter_spawner)
		i += 1
		

func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true


func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false
