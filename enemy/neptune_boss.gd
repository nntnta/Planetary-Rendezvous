extends Node2D

@export var max_hp = 20
@export var hp = 20

var rotate_speed = 1
var player_pos
#@export var rare_drop : PackedScene
var being_knocked_back = true
var kb_modifier = 10 + global.exp_jupiter
# Called when the node enters the scene tree for the first time.
func _ready():
	$body/status.visible = false
	player_pos = $"../player".position
	#if flip == 0:
		#$body/sprite.flip_h = !$body/sprite.flip_h
	
func _physics_process(delta):
	$body.rotation += rotate_speed * delta

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

func _on_hit_box_area_entered(area):
	if area.is_in_group('melee_weapon'):
		var actual_dmg = 2
		$body/sprite.self_modulate = Color(100,100,100)
		receive_knockback(area.global_position, actual_dmg)
		$body/hitbox/attacked.start()


func _on_grab_box_area_entered(area):
	if area.is_in_group('player'):
		$"../player/player_interface/inventory/UI/inv_grid".add_item('neptune_ring')
		global.original_hp += 10
		global.melee_dmg += 1.5
		$AnimationPlayer.play('status')

func speed_up():
	rotate_speed = 30
	
func speed_down():
	rotate_speed = 1
