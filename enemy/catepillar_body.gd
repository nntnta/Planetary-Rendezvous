extends CharacterBody2D

var last_velocity = velocity
var dead = false



func _physics_process(delta):
	if $"..".hp <= 0 && !dead:
		dead = true
		global.exp_pluto += 10
		global.catepillar_dead = true
		$"../AnimationPlayer".play('dead')
		
			
	elif !dead:
		if last_velocity.x > 0:
			$sprite.flip_h = true
		if last_velocity.x <= 0:
			$sprite.flip_h = false
		move_and_slide()
	
		if velocity.length() >= 0:
			last_velocity = velocity
			if $"..".hp == $"..".max_hp:
				$"../AnimationPlayer".play('idle')
			if $"..".hp < $"..".max_hp:
				$"../AnimationPlayer".play('attacked')


