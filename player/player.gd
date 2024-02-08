extends CharacterBody2D

const SPEED = 15000.0
var swing = false

func _physics_process(delta):
	velocity  = Input.get_vector("a",'d','w','s') * SPEED * delta
	print(swing)
	if velocity == Vector2.ZERO && !swing:
		$AnimationTree.get("parameters/playback").travel("idle")
	
	elif !swing:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", velocity)
		$AnimationTree.set("parameters/walk/blend_position", velocity)
		$AnimationTree.set("parameters/swingPickaxe/blend_position", velocity)
		move_and_slide()
	
func _input(event):
	if event.is_action_pressed("leftClick", false) && !swing && !global.bronze_pickaxe_drop:
		swing = true
		$AnimationTree.get("parameters/playback").travel("swingPickaxe")
		
		
func end_swinging():
	swing = false
	
