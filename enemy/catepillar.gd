extends Node2D

@export var max_hp = 20
@export var hp = 20

var player_pos
#@export var rare_drop : PackedScene
var being_knocked_back = true
var kb_modifier = 40 + global.exp_jupiter
# Called when the node enters the scene tree for the first time.
func _ready():
	#$body/status.visible = false
	player_pos = $"../player".position
	#if flip == 0:
		#$body/sprite.flip_h = !$body/sprite.flip_h
	
func receive_knockback(dmg_source: Vector2, dmg_received: int):
	if being_knocked_back:
		var kb_direction = dmg_source.direction_to(self.global_position)
		var kb_strength = dmg_received * kb_modifier
		var knockback = kb_direction * kb_strength
		var tween = create_tween()
		print(self_modulate)
		tween.tween_property(self,'global_position',global_position+knockback,0.2)


func _on_attacked_timeout():
	$body/sprite.self_modulate = Color(1,1,1)


func _on_hitbox_area_entered(area):
	if area.is_in_group('melee_weapon'):
		var actual_dmg = 2
		$body/sprite.self_modulate = Color(100,100,100)
		receive_knockback(area.global_position, actual_dmg)
		$body/hitbox/attacked.start()