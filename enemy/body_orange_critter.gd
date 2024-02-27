extends CharacterBody2D
var last_velocity = velocity
var dead = false
@export var rare_drop : PackedScene

func _physics_process(delta):
	if $"..".hp <= 0 && !dead:
		if !$"..".pink_variant:
			dead = true
			$"../AnimationPlayer".play('dead')
		if $"..".pink_variant:
			var drop_spawner = rare_drop.instantiate()
			drop_spawner.global_position = $".".global_position
			get_tree().current_scene.call_deferred('add_child', drop_spawner)
			drop_spawner.z_index = -1
			dead = true
			global.exp_jupiter += 1
			$"../AnimationPlayer".play('dead')
		global.exp_jupiter += 1
		global.ammo += 1
			
	elif !dead:
		if last_velocity.x > 0:
			$sprite.flip_h = true
			$attack/coll.position.x = 35
			$attack/coll2.position.x = 12
			$attack/coll3.position.x = 10
		if last_velocity.x <= 0:
			$sprite.flip_h = false
			$attack/coll.position.x = -35
			$attack/coll2.position.x = -12
			$attack/coll3.position.x = -10
		move_and_slide()
	
		if velocity.length() > 0:
			last_velocity = velocity
			$attack/coll.disabled = true
			$attack/coll2.disabled = true
			$attack/coll3.disabled = true
			$"../AnimationPlayer".play('idle')
		else:
			$"../AnimationPlayer".play('attacking')
