extends CharacterBody2D

var last_velocity = velocity
var dead = false



func _physics_process(delta):
	if $"..".hp <= 0 && !dead:
		dead = true
		global.exp_neptune += 10
		global.unlocked_pluto = true
		$"../AnimationPlayer".play('dead')
		
			
	elif !dead:
		#if last_velocity.x > 0:
			#$sprite.flip_h = true
			#$attack/coll.position.x = 35
			#$attack/coll2.position.x = 12
			#$attack/coll3.position.x = 10
		#if last_velocity.x <= 0:
			#$sprite.flip_h = false
			#$attack/coll.position.x = -35
			#$attack/coll2.position.x = -12
			#$attack/coll3.position.x = -10
		move_and_slide()
	
		if velocity.length() > 0:
			#if $sprite.frame_coords.x == 1 && $sprite.frame_coords.y == 0:
				#$sprite.frame_coords = Vector2(0,0)
			$"../AnimationPlayer".play('idle')
			#$sprite.frame_coords = Vector2(0,0)
			last_velocity = velocity
			$"..".rotate_speed = 1
			
		else:
			$"..".rotate_speed = 30
			$sprite.frame_coords = Vector2(1,0)

func drop_item():
	global.neptune_boss_dead = true
	$sprite.frame_coords = Vector2(1,1)
	$sprite.scale = Vector2(0.25,0.25)
	$coll_env/coll_for_env.disabled = true
	$coll_env/coll2.disabled = true
	$coll_env/coll3.disabled = true
	$coll_env/coll4.disabled = true
	$hitbox/coll.disabled = true
	$hurtBox/coll.disabled = true
	$hurtBox/coll2.disabled = true
	$hurtBox/coll3.disabled = true
	$hurtBox/coll4.disabled = true
	$"../AnimationPlayer".play('drop_idle')
