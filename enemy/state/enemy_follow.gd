extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed := 35
var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group('player')

func physics_update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if $"../..".hp <= 0:
		transitioned.emit(self, "dies")
	
	if direction.length() > 60 :
		enemy.velocity = direction.normalized() * move_speed * delta
	else:
		enemy.velocity = Vector2()

	if direction.length() > 350:
		transitioned.emit(self, "idle")
