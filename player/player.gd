extends CharacterBody2D

const SPEED = 15000.0


func _physics_process(delta):
	velocity  = Input.get_vector("a",'d','w','s') * SPEED * delta
	print(velocity)
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("idle")
	
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", velocity)
		$AnimationTree.set("parameters/walk/blend_position", velocity)
		move_and_slide()
	
	
	
