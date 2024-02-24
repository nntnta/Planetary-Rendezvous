extends CharacterBody2D
var last_velocity = velocity
var dead = false

func _physics_process(delta):
	if $"..".hp <= 0 && !dead:
		dead = true
		$"../AnimationPlayer".play('dead')
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
			$"../AnimationPlayer".queue('attacking')
