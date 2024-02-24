extends Node2D

var hp = 2
var player_pos 
var following = false
var dead = false
var flip = randi_range(0,1)
# Called when the node enters the scene tree for the first time.
func _ready():
	player_pos = $"../player".position
	#if flip == 0:
		#$body/sprite.flip_h = !$body/sprite.flip_h
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_hitbox_area_entered(area):
	if area.is_in_group('melee_weapon'):
		#hp -= 1
		$body/sprite.self_modulate = Color(100,100,100)
		$body/hitbox/attacked.start()
		

func _on_attacked_timeout():
	$body/sprite.self_modulate = Color(1,1,1)
