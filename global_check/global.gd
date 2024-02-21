extends Node

func _process(delta):
	max_hp = 10 + floor(exp_earth/2)
	
	if exp_earth >= 1 && exp_mars >= 1 && exp_mercury >= 1 && exp_venus >= 1:
		silver_pickaxe_drop = false

#slots------------------------------------------------------------------------------------------------
var slot = 'inv1'
#slots------------------------------------------------------------------------------------------------

#tools---------------------------------------------------------------------------------------------------
var bronze_pickaxe_drop		= true
var silver_pickaxe_drop		= true
var gold_pickaxe_drop		= true
var diamond_pickaxe_drop	= true
var cosmium_pickaxe_drop	= true

var frostblade_drop			= true
#tools---------------------------------------------------------------------------------------------------

#rare------
var shiny_floral = false
#rare------

#items-------
var item_array = []
var healing_factor_dropped = false
#items-------

#stats
var hp = 10
var max_hp = 10
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
