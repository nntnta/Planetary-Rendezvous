extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if randi_range(0,100) < 10:
		$AnimationPlayer.play('idle_shiny')
	else:
		$AnimationPlayer.play('idle')
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
