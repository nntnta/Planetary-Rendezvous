extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	global.hp = global.max_hp



func _on_retry_pressed():
	#$transition/ColorRect.visible = true
	#$transition.play("fadeout")
	#await get_tree().create_timer(0.5, false).timeout
	Transition.retry_pressed()
	#get_tree().change_scene_to_packed(menu)
	#Transition.fadein()
	
