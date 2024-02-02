extends CharacterBody2D

const SPEED = 15000.0


func _physics_process(delta):
	velocity  = Input.get_vector("a",'d','w','s') * SPEED * delta
	move_and_slide()
