extends State
class_name  EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed := 10
@export var search_range = 200
@export var max_wander_time = 3
var player: CharacterBody2D
var move_direction: Vector2
var wander_time : float

func random_move():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,max_wander_time)

func enter():
	player = get_tree().get_first_node_in_group('player')
	random_move()

func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		random_move()
		
func physics_update(delta: float):
	if enemy:
		enemy.velocity = move_direction * move_speed * delta
	
	var direction = player.global_position - enemy.global_position
	if direction.length() < search_range:
		transitioned.emit(self, "follow")
