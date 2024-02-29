extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.unique_all_planets && !global.catepillar_dead:
		$butterfly.visible = false
		$AnimationPlayer.play('good')
	
	if global.catepillar_dead:
		$butterfly.visible = true
		$good.visible = false
		$AnimationPlayer.play('butterfly')
