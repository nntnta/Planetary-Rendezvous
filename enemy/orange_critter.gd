extends Node2D

var hp = 2
var player_pos 
var following = false
var flip = randi_range(0,1)
# Called when the node enters the scene tree for the first time.
func _ready():
	player_pos = $"../player".position
	#if flip == 0:
		#$body/sprite.flip_h = !$body/sprite.flip_h
	$AnimationPlayer.play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp == 0:
		$AnimationPlayer.play('dead')
	


func _on_hitbox_area_entered(area):
	if area.is_in_group('melee_weapon'):
		hp -= 1


func _on_search_area_entered(area):
	if area.is_in_group('player'):
		following = true


func _on_search_area_exited(area):
	if area.is_in_group('player'):
		following = false


func _on_attack_area_entered(area):
	if area.is_in_group('player'):
		$AnimationPlayer.play('attacking')


func _on_attack_area_exited(area):
	if area.is_in_group('player'):
		$AnimationPlayer.play('idle')
