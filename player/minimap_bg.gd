extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$"../..".scale.x = $"../../../../../bg".scale.x
	#$"../..".scale.y = $"../../../../../bg".scale.y
	position = $"../../../../../bg".position
	scale.x = $"../../../../../bg".scale.x
	scale.y = $"../../../../../bg".scale.y
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
