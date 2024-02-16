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

func _ready():
	Transition.takeOffArea = true
	Transition.inMenu = true
	$AnimationPlayer.play('idle_bg')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mercury_pressed():
	Transition.inMenu = false
	Transition.change_scene(mercury, "mercury")


func _on_venus_pressed():
	Transition.inMenu = false
	Transition.change_scene(venus, "venus")


func _on_earth_pressed():
	Transition.inMenu = false
	Transition.change_scene(earth, "earth")


func _on_mars_pressed():
	Transition.inMenu = false
	Transition.change_scene(mars, "mars")


func _on_jupiter_pressed():
	Transition.inMenu = false
	Transition.change_scene(jupiter, "jupiter")


func _on_saturn_pressed():
	Transition.inMenu = false
	Transition.change_scene(saturn, "saturn")


func _on_uranus_pressed():
	Transition.inMenu = false
	Transition.change_scene(uranus, "uranus")


func _on_neptune_pressed():
	Transition.inMenu = false
	Transition.change_scene(neptune, "neptune")


func _on_pluto_pressed():
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
