extends Node2D

@export var mercury: PackedScene
@export var venus: PackedScene
@export var earth: PackedScene
@export var mars: PackedScene
@export var jupiter: PackedScene
@export var saturn: PackedScene
@export var uranus: PackedScene
@export var neptune: PackedScene
@export var pluto: PackedScene
# Called when the node enters the scene tree for the first time.
var locked_1 = true
var locked_2 = true
var locked_3 = true
var locked_4 = true
var locked_5 = true
var locked_6 = true
var locked_7 = true
var locked_8 = true
var locked_9 = true

func _ready():
	Transition.takeOffArea = true
	Transition.inMenu = true
	$AnimationPlayer.play('idle_bg')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.unlocked_mercury && locked_1:
		locked_1 = false
		$planets/mercury.disabled = false
	if global.unlocked_venus && locked_2:
		locked_2 = false
		$planets/venus.disabled = false
	if global.unlocked_mars && locked_3:
		locked_3 = false
		$planets/mars.disabled = false
	if global.unlocked_jupiter && locked_4:
		locked_4 = false
		$planets/jupiter.disabled = false
	if global.unlocked_saturn && locked_5:
		locked_5 = false
		$planets/saturn.disabled = false
	if global.unlocked_uranus && locked_6:
		locked_6 = false
		$planets/uranus.disabled = false
	if global.unlocked_neptune && locked_7:
		locked_7 = false
		$planets/neptune.disabled = false
	if global.unlocked_pluto && locked_8:
		locked_8 = false
		$planets/pluto.disabled = false
	if global.unlocked_pluto && locked_9:
		locked_9 = false
		$planets/earth.disabled = false


func _on_mercury_pressed():
	$planets/mercury.disabled = true
	Transition.inMenu = false
	Transition.change_scene(mercury, "mercury")


func _on_venus_pressed():
	$planets/venus.disabled = true
	Transition.inMenu = false
	Transition.change_scene(venus, "venus")


func _on_earth_pressed():
	$planets/earth.disabled = true
	Transition.inMenu = false
	Transition.change_scene(earth, "earth")


func _on_mars_pressed():
	$planets/mars.disabled = true
	Transition.inMenu = false
	Transition.change_scene(mars, "mars")


func _on_jupiter_pressed():
	$planets/jupiter.disabled = true
	Transition.inMenu = false
	Transition.change_scene(jupiter, "jupiter")


func _on_saturn_pressed():
	$planets/saturn.disabled = true
	Transition.inMenu = false
	Transition.change_scene(saturn, "saturn")


func _on_uranus_pressed():
	$planets/uranus.disabled = true
	Transition.inMenu = false
	Transition.change_scene(uranus, "uranus")


func _on_neptune_pressed():
	$planets/neptune.disabled = true
	Transition.inMenu = false
	Transition.change_scene(neptune, "neptune")


func _on_pluto_pressed():
	$planets/pluto.disabled = true
	Transition.inMenu = false
	Transition.change_scene(pluto, "pluto")

func _input(event):
	if event.is_action_pressed("esc") && Transition.takeOffArea:
		Transition.inMenu = false
		match Transition.current_scene:
			"mercury":
				Transition.resume(mercury, "mercury")
			"venus":
				Transition.resume(venus, "venus")
			"earth":
				Transition.resume(earth, "earth")
			"mars":
				Transition.resume(mars, "mars")
			"jupiter":
				Transition.resume(jupiter, "jupiter")
			"saturn":
				Transition.resume(saturn, "saturn")
			"uranus":
				Transition.resume(uranus, "uranus")
			"neptune":
				Transition.resume(neptune, "neptune")
			"pluto":
				Transition.resume(pluto, "pluto")
