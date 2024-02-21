extends Node2D

@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var earth_mineral: PackedScene

var mouse_in = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Transition.takeOffArea = true
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	
	mineral_spawn()
	#print(self.editor_description)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true


func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false

func mineral_spawn():
	var i = 0
	while  i < 11:
		var mineral_spawner = earth_mineral.instantiate()
		mineral_spawner.position = Vector2i(randi_range(650, 1200),randi_range(50,1100))
		get_tree().current_scene.call_deferred('add_child', mineral_spawner)
		i += 1
