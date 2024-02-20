extends SubViewport

@onready var camera = $Camera2D

func _ready():
	pass


func _physics_process(_delta):
	camera.global_position = $"../../..".position
	
