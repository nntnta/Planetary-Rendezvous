extends Node2D

var max_hp = 2
var hp = 2
var player_pos 
var following = false
var dead = false
var flip = randi_range(0,1)
var skin = Color(1,1,1)
var pink_variant = false
var being_knocked_back = true
var kb_modifier = 35 + global.exp_jupiter
# Called when the node enters the scene tree for the first time.
func _ready():
	player_pos = $"../player".position
	if randi_range(0,100) < 6+global.exp_mars && !global.shiny_orange_critter && !global.unlimited_ammo_dropped:
		$body/sprite.self_modulate = Color(40,1,11)
		skin = Color(40,1,11)
		max_hp = 10
		hp = 10
		pink_variant = true
		global.shiny_orange_critter = true
	#if flip == 0:
		#$body/sprite.flip_h = !$body/sprite.flip_h
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_hitbox_area_entered(area):
	if area.is_in_group('melee_weapon'):
		#hp -= 1
		var actual_dmg = 2
		$body/sprite.self_modulate = Color(100,100,100)
		receive_knockback(area.global_position, actual_dmg)
		$body/hitbox/attacked.start()
		
		

func receive_knockback(dmg_source: Vector2, dmg_received: int):
	if being_knocked_back:
		var kb_direction = dmg_source.direction_to(self.global_position)
		var kb_strength = dmg_received * kb_modifier
		var knockback = kb_direction * kb_strength
		var tween = create_tween()
		print(knockback)
		tween.tween_property(self,'global_position',global_position+knockback,0.2)
		#global_position.move_toward(knockback,1)

func _on_attacked_timeout():
	$body/sprite.self_modulate = skin
