extends Node
var heal_factor_cd = 3

func _process(delta):
	max_hp = original_hp + (0.5*exp_earth)
	extra_speed = exp_mercury * 1000
	max_ammo = 20 + exp_jupiter
	if exp_earth >= 1 && exp_mars >= 1 && exp_mercury >= 1 && exp_venus >= 1:
		silver_pickaxe_drop = false
	
	if healing_factor_dropped:
		if heal_factor_cd > 0:
			heal_factor_cd -= delta
		elif hp < max_hp:
			hp += 1
			heal_factor_cd = 3
		else:
			heal_factor_cd = 3
	
	if unique_jupiter_dropped && unique_mars_dropped && unique_mercury_dropped && unique_neptune_dropped && unique_pluto_dropped && unique_saturn_dropped && unique_uranus_dropped && unique_venus_dropped:
		unique_all_planets = true
			
#planets unlocked
var unlocked_mercury = false
var unlocked_venus = false
var unlocked_mars = false
var unlocked_jupiter = false
var unlocked_saturn = false
var unlocked_uranus = false
var unlocked_neptune = false
var unlocked_pluto = false
var unlocked_all_planets = false
#planets unlocked

#slots------------------------------------------------------------------------------------------------
var slot = 'inv1'
#slots------------------------------------------------------------------------------------------------

#tools---------------------------------------------------------------------------------------------------
var bronze_pickaxe_drop		= true
var silver_pickaxe_drop		= true
var gold_pickaxe_drop		= true
var diamond_pickaxe_drop	= true
var cosmium_pickaxe_drop	= true

var basic_baton_drop		= true
var frostblade_drop			= true #true real

var star_shooter_drop		= true
var banana_shooter_drop		= true
#tools---------------------------------------------------------------------------------------------------

#rare------
var shiny_floral = false
var shiny_orange_critter = false
var banana_summoned = false
#rare------

#items-------
var item_array = []
var healing_factor_dropped = false
var unlimited_ammo_dropped = false

var minimap_dropped = true
#items-------

#stats
var original_hp = 10
var hp = 10
var max_hp = 10
var extra_speed = 0
var melee_dmg = 0.5
var ammo = 20
var max_ammo = 20
#stats

#planet exp------
var exp_mercury = 0
var exp_venus = 0
var exp_earth = 0
var exp_mars = 0
var exp_jupiter = 0
var exp_saturn = 0
var exp_neptune = 0
var exp_uranus = 0
var exp_pluto = 0
#planet exp------

#uniques
var unique_mercury_dropped = false
var unique_venus_dropped = false
var unique_mars_dropped = false
var unique_jupiter_dropped = false
var unique_saturn_dropped = false
var unique_uranus_dropped = false
var unique_neptune_dropped = false
var unique_pluto_dropped = false
var unique_all_planets = false
var neptune_boss_dead = false
var catepillar_dead = false
#uniques
