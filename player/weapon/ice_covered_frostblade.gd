extends Node2D
var hp = 10
var blade_dropped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_area_entered(area):
	if area.is_in_group('pickaxe') && !global.silver_pickaxe_drop:
		hp -= 2
		if hp == 6:
			$hitbox/sprite.frame_coords = Vector2(0,1)
		if hp == 2:
			$hitbox/sprite.frame_coords = Vector2(0,2)
		if hp <= 0:
			if !blade_dropped:
				$coll_for_env.queue_free()
			$hitbox/sprite.frame_coords = Vector2(0,3)
			$hitbox/sprite.rotation = PI/4
			blade_dropped = true
			
	if area.is_in_group('pickaxe') && global.silver_pickaxe_drop:
		$AnimationPlayer.play('cant_break')
			
	if area.is_in_group('player') && blade_dropped:
		global.frostblade_drop = false
		queue_free()
