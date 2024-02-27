extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.unlocked_all_planets:
		$AnimationPlayer.play('good')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
