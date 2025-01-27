extends Node2D
var player_in = false
var mouseIn = false
# Called when the node enters the scene tree for the first time.
func _ready():
	player_in = false
	$AnimationPlayer.play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_in:
		$hover.visible = true
	
	if !player_in:
		$hover.visible = false
	
	if !global.bronze_pickaxe_drop:
		queue_free()


func _on_grab_box_area_entered(area):
	if area.is_in_group('player'):
		player_in = true
		
func _on_grab_box_area_exited(area):
	if area.is_in_group('player'):
		player_in = false


func _input(event):
	if (event.is_action_pressed("rightClick") or event.is_action_pressed("leftClick") or event.is_action_pressed("spaceBar")) && player_in:
		global.unlocked_mercury = true
		global.unlocked_venus = true
		global.unlocked_mars = true
		player_in = false
		$coll_env/CollisionShape2D.disabled = true
		$AnimationPlayer.play('pop_up')


func _on_grab_box_mouse_entered():
	mouseIn = true


func _on_grab_box_mouse_exited():
	mouseIn = false

func picked():
	global.bronze_pickaxe_drop = false
