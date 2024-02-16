extends CharacterBody2D

const SPEED = 15000.0
var swing = false

func _ready():
	$tools/pickaxe/hitbox/coll.disabled = true
	$tools/pickaxe/pickaxe.visible = false

func _physics_process(delta):
	velocity  = Input.get_vector("a",'d','w','s') * SPEED * delta
	pickaxeCollHidden()
	
	if velocity == Vector2.ZERO && !swing:
		$AnimationTree.get("parameters/playback").travel("idle")
	
	elif !swing:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", velocity)
		$AnimationTree.set("parameters/walk/blend_position", velocity)
		
		move_and_slide()
	
func _input(event):
	if event.is_action_pressed("leftClick", false) && !swing && !global.bronze_pickaxe_drop && global.slot == 'inv1':
		$AnimationTree.set("parameters/swingPickaxe/blend_position", global_position.direction_to(get_global_mouse_position()))
		$AnimationTree.set("parameters/idle/blend_position", global_position.direction_to(get_global_mouse_position()))
		swing = true
		$AnimationTree.get("parameters/playback").travel("swingPickaxe")
		
		
func end_swinging():
	swing = false
	


func _on_hitbox_area_entered(area):
	if area.is_in_group('mineral'):
		#$tools/pickaxe/hitbox/coll.disabled = true
		pass

func pickaxeCollHidden():
	if !$tools/pickaxe/pickaxe.visible:
		$tools/pickaxe/hitbox/coll.disabled = true
	elif $tools/pickaxe/pickaxe.visible:
		$tools/pickaxe/hitbox/coll.disabled = false
