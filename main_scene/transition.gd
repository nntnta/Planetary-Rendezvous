extends Node2D

@export var menu: PackedScene
@export var good: PackedScene
var current_scene
var takeOffArea = false
var inMenu = false
var takeoff_clicked = false


func change_scene(planet: PackedScene, name):
	global.shiny_floral = false
	
	
	current_scene = name
	$transition/ColorRect.visible = true
	$transition.play("fadeout")
	await get_tree().create_timer(0.5, false).timeout
	get_tree().change_scene_to_packed(planet)
	$transition.play("fadein")
	takeoff_clicked = false
	
func resume(planet: PackedScene, name):
	current_scene = name
	await get_tree().create_timer(0.1, false).timeout
	get_tree().change_scene_to_packed(planet)



func _input(event):
	if (event.is_action_pressed("rightClick") or event.is_action_pressed("spaceBar")) && takeOffArea && !inMenu && !takeoff_clicked :
		takeoff_clicked = true
		$transition/ColorRect.visible = true
		$transition.play("fadeout")
		await get_tree().create_timer(0.5, false).timeout
		get_tree().change_scene_to_packed(menu)
		$transition.play("fadein")

func retry_pressed():
	$transition/ColorRect.visible = true
	$transition.play("fadeout")
	await get_tree().create_timer(0.5, false).timeout
	get_tree().change_scene_to_packed(menu)
	$transition.play("fadein")
	
func good_ending():
	$transition/ColorRect.visible = true
	$transition.play("fadeout")
	await get_tree().create_timer(0.5, false).timeout
	get_tree().change_scene_to_packed(good)
	$transition.play("fadein")

func exit_rocket():
	takeOffArea = false
	takeoff_clicked = true
	$transition/ColorRect.visible = true
	$transition.play("fadeout")
	await get_tree().create_timer(0.5, false).timeout
	get_tree().change_scene_to_packed(menu)
	$transition.play("fadein")
