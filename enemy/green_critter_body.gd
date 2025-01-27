extends CharacterBody2D
var last_velocity = velocity
var dead = false
var deflected = false

func _ready():
	deflected = false

func _physics_process(delta):
	if $"..".hp <= 0 && !dead:
		dead = true
		
		if deflected:
			$"../..".deflected_dead += 1
			
		global.exp_saturn += 2
		$"../AnimationPlayer".play('dead')
	elif !dead:
		if last_velocity.x > 0:
			$sprite.flip_h = true
			$attack/coll.position.x = 12.5

		if last_velocity.x <= 0:
			$sprite.flip_h = false
			$attack/coll.position.x = -12.5
		
		move_and_slide()
	
		if velocity.length() > 0:
			last_velocity = velocity
			$attack/coll.disabled = true
	
			$"../AnimationPlayer".play('idle')
		else:
			$"../AnimationPlayer".play('attacking')
