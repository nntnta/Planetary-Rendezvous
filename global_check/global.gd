extends Node

func _process(delta):
	if exp_earth >= 5 && exp_mars >= 5 && exp_mercury >= 5 && exp_venus >= 5:
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
