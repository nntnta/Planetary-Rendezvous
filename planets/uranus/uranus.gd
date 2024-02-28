extends Node2D
@onready var current_pos = $spawn_player
@export var player: PackedScene
@export var frostblade: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$natural_drops/minimap_device/AnimationPlayer.play('idle')
	if $unique:
		$unique/coll_for_env/coll.disabled = true
	Transition.takeOffArea = true
	var player_spawn = player.instantiate()
	player_spawn.position = current_pos.global_position
	get_tree().current_scene.call_deferred('add_child', player_spawn)
	if global.frostblade_drop:
		frostblade_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.unique_uranus_dropped && $unique:
		$unique.queue_free()
	
	if global.exp_uranus >= 10 && $unique:
		$unique/coll_for_env/coll.disabled = false
		$unique.visible = true


func _on_takeoff_area_entered(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = true


func _on_takeoff_area_exited(area):
	if area.is_in_group('player'):
		Transition.takeOffArea = false

func frostblade_spawn():
	var frostblade_spawner = frostblade.instantiate()
	frostblade_spawner.position = Vector2i(200,500)
	get_tree().current_scene.call_deferred('add_child', frostblade_spawner)
